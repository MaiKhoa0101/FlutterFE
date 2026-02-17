part of 'sales_bloc.dart';

abstract class SalesEvent extends Equatable {
  const SalesEvent();
}

class LoadOrders extends SalesEvent {
  @override
  List<Object> get props => [];
}

class AddToCart extends SalesEvent {
  final Product product;

  const AddToCart(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFromCart extends SalesEvent {
  final Product product;

  const RemoveFromCart(this.product);

  @override
  List<Object> get props => [product];
}

class ClearCart extends SalesEvent {
  @override
  List<Object> get props => [];
}

class CheckoutOrder extends SalesEvent {
  @override
  List<Object> get props => [];
}
