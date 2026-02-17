import 'package:equatable/equatable.dart';
import '../../../product/domain/entities/product.dart'; // Sửa đường dẫn import

class OrderItem extends Equatable {
  final Product product;
  final int quantity;
  final double priceAtSale;

  const OrderItem({
    required this.product,
    required this.quantity,
    required this.priceAtSale,
  });

  double get total => quantity * priceAtSale;

  @override
  List<Object?> get props => [product, quantity, priceAtSale];
}

class Order extends Equatable {
  final String id;
  final DateTime createdAt;
  final List<OrderItem> items;
  final double totalPrice;

  const Order({
    required this.id,
    required this.createdAt,
    required this.items,
    required this.totalPrice,
  });

  @override
  List<Object?> get props => [id, createdAt, items, totalPrice];
}
