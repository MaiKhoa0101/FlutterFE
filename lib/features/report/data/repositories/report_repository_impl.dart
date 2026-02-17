import 'package:dartz/dartz.dart' hide Order;
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../inventory/domain/repositories/inventory_repository.dart';
import '../../../sales/domain/repositories/sales_repository.dart';
import '../../domain/entities/report_stats.dart';
import '../../domain/repositories/report_repository.dart';

@Injectable(as: ReportRepository)
class ReportRepositoryImpl implements ReportRepository {
  final SalesRepository salesRepository;
  final InventoryRepository inventoryRepository;

  ReportRepositoryImpl(this.salesRepository, this.inventoryRepository);

  @override
  Future<Either<Failure, ReportStats>> getReport(DateTime from, DateTime to) async {
    try {
      // 1. Lấy tất cả đơn hàng
      final ordersResult = await salesRepository.getOrders();
      // 2. Lấy tất cả nguyên liệu (để tra cứu giá vốn)
      final ingredientsResult = await inventoryRepository.getIngredients();

      return ordersResult.fold(
        (failure) => Left(failure),
        (allOrders) => ingredientsResult.fold(
          (failure) => Left(failure),
          (ingredients) {
            // Map để tra cứu giá vốn nhanh: ID -> CostPerUnit
            final ingredientCostMap = {for (var i in ingredients) i.id: i.costPerUnit};

            double totalRevenue = 0;
            double totalCost = 0;
            int totalOrders = 0;
            final Map<String, _ProductStat> productStatsMap = {};

            // Lọc đơn hàng trong khoảng thời gian
            final filteredOrders = allOrders.where((order) {
              return order.createdAt.isAfter(from) && order.createdAt.isBefore(to);
            }).toList();

            totalOrders = filteredOrders.length;

            for (var order in filteredOrders) {
              totalRevenue += order.totalPrice;

              for (var item in order.items) {
                // --- Tính giá vốn cho từng món (dựa trên công thức) ---
                double itemCost = 0;
                for (var recipeItem in item.product.recipe) {
                  final costPerUnit = ingredientCostMap[recipeItem.ingredientId] ?? 0;
                  itemCost += recipeItem.amount * costPerUnit;
                }
                // Tổng giá vốn của item line này (giá vốn 1 món * số lượng mua)
                totalCost += itemCost * item.quantity;

                // --- Thống kê Top Product ---
                if (!productStatsMap.containsKey(item.product.name)) {
                  productStatsMap[item.product.name] = _ProductStat(item.product.name);
                }
                productStatsMap[item.product.name]!.quantity += item.quantity;
                productStatsMap[item.product.name]!.revenue += (item.priceAtSale * item.quantity);
              }
            }

            // Sắp xếp Top Product
            final topProducts = productStatsMap.values
                .map((e) => TopProduct(name: e.name, quantity: e.quantity, revenue: e.revenue))
                .toList()
              ..sort((a, b) => b.quantity.compareTo(a.quantity)); // Sắp xếp giảm dần theo số lượng

            return Right(ReportStats(
              totalRevenue: totalRevenue,
              totalCost: totalCost,
              totalProfit: totalRevenue - totalCost,
              totalOrders: totalOrders,
              topProducts: topProducts.take(5).toList(), // Lấy top 5
            ));
          },
        ),
      );
    } catch (e) {
      return Left(CacheFailure("Report calculation failed: $e"));
    }
  }
}

// Helper class nội bộ
class _ProductStat {
  final String name;
  int quantity = 0;
  double revenue = 0;
  _ProductStat(this.name);
}
