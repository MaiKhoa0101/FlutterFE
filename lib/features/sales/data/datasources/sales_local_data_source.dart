import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../models/order_model.dart';

abstract class SalesLocalDataSource {
  Future<List<OrderModel>> getOrders();
  Future<void> saveOrder(OrderModel order);
}

@Injectable(as: SalesLocalDataSource)
class SalesLocalDataSourceImpl implements SalesLocalDataSource {
  static const String boxName = 'orders';

  Future<Box<OrderModel>> _openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<OrderModel>(boxName);
    }
    return Hive.box<OrderModel>(boxName);
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    final box = await _openBox();
    return box.values.toList()..sort((a, b) => b.createdAt.compareTo(a.createdAt)); // Mới nhất lên đầu
  }

  @override
  Future<void> saveOrder(OrderModel order) async {
    final box = await _openBox();
    await box.put(order.id, order);
  }
}
