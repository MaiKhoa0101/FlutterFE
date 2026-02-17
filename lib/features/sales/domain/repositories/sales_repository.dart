import 'package:dartz/dartz.dart' hide Order;
import '../../../../core/error/failures.dart';
import '../../domain/entities/order.dart';

abstract class SalesRepository {
  Future<Either<Failure, List<Order>>> getOrders();
  Future<Either<Failure, void>> createOrder(Order order);
}
