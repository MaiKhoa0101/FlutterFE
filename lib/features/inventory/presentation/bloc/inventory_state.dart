part of 'inventory_bloc.dart';

abstract class InventoryState extends Equatable {
  const InventoryState();
}

class InventoryInitial extends InventoryState {
  @override
  List<Object> get props => [];
}

class InventoryLoading extends InventoryState {
  @override
  List<Object> get props => [];
}

class InventoryLoaded extends InventoryState {
  final List<Ingredient> ingredients;

  const InventoryLoaded(this.ingredients);

  @override
  List<Object> get props => [ingredients];
}

class InventoryError extends InventoryState {
  final String message;

  const InventoryError(this.message);

  @override
  List<Object> get props => [message];
}
