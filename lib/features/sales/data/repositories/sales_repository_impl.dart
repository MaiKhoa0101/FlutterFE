import 'package:dartz/dartz.dart' hide Order; // Hide Order from dartz if exists (usually Tuple2 etc but safe to hide)
import 'package:injectable/injectable.dart' hide Order; // Hide @Order annotation

import '../../../../core/error/failures.dart';
import '../../domain/entities/order.dart'; // This is our Entity
import '../../domain/repositories/sales_repository.dart';
import '../datasources/sales_local_data_source.dart';
import '../models/order_model.dart';

@Injectable(as: SalesRepository)
class SalesRepositoryImpl implements SalesRepository {
  final SalesLocalDataSource localDataSource;

  SalesRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Order>>> getOrders() async {
    try {
      final models = await localDataSource.getOrders();
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(CacheFailure('Failed to load orders: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> createOrder(Order order) async {
    try {
      await localDataSource.saveOrder(OrderModel.fromEntity(order));
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to create order: $e'));
    }
  }
}
