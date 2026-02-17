part of 'inventory_bloc.dart';

abstract class InventoryEvent extends Equatable {
  const InventoryEvent();
}

class LoadIngredients extends InventoryEvent {
  @override
  List<Object> get props => [];
}

class AddIngredient extends InventoryEvent {
  final Ingredient ingredient;

  const AddIngredient(this.ingredient);

  @override
  List<Object> get props => [ingredient];
}

class UpdateIngredient extends InventoryEvent {
  final Ingredient ingredient;

  const UpdateIngredient(this.ingredient);

  @override
  List<Object> get props => [ingredient];
}

class DeleteIngredient extends InventoryEvent {
  final String id;

  const DeleteIngredient(this.id);

  @override
  List<Object> get props => [id];
}

class ImportStock extends InventoryEvent {
  final String ingredientId;
  final double quantity;
  final double cost;

  const ImportStock(this.ingredientId, this.quantity, this.cost);

  @override
  List<Object> get props => [ingredientId, quantity, cost];
}
