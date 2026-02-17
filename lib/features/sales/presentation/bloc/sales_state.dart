part of 'sales_bloc.dart';

abstract class SalesState extends Equatable {
  const SalesState();
}

class SalesInitial extends SalesState {
  @override
  List<Object> get props => [];
}

class SalesLoading extends SalesState {
  @override
  List<Object> get props => [];
}

class SalesCartUpdated extends SalesState {
  final List<OrderItem> cartItems;
  final double total;
  // Dùng identityHashCode để ép buộc Bloc nhận diện đây là state mới
  // mỗi khi chúng ta emit một instance mới
  final int _version; 

  SalesCartUpdated(this.cartItems, this.total) : _version = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [cartItems, total, _version];
}

class SalesCheckoutSuccess extends SalesState {
  @override
  List<Object> get props => [];
}

class SalesError extends SalesState {
  final String message;

  const SalesError(this.message);

  @override
  List<Object> get props => [message];
}

class OrderHistoryLoaded extends SalesState {
  final List<Order> orders;

  const OrderHistoryLoaded(this.orders);

  @override
  List<Object> get props => [orders];
}
