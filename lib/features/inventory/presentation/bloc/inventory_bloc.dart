import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/ingredient.dart';
import '../../domain/repositories/inventory_repository.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';

@injectable
class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final InventoryRepository repository;

  InventoryBloc(this.repository) : super(InventoryInitial()) {
    on<LoadIngredients>(_onLoadIngredients);
    on<AddIngredient>(_onAddIngredient);
    on<UpdateIngredient>(_onUpdateIngredient);
    on<DeleteIngredient>(_onDeleteIngredient);
    on<ImportStock>(_onImportStock);
  }

  Future<void> _onLoadIngredients(LoadIngredients event, Emitter<InventoryState> emit) async {
    emit(InventoryLoading());
    final result = await repository.getIngredients();
    result.fold(
      (failure) => emit(InventoryError(failure.message)),
      (ingredients) => emit(InventoryLoaded(ingredients)),
    );
  }

  Future<void> _onAddIngredient(AddIngredient event, Emitter<InventoryState> emit) async {
    final result = await repository.addIngredient(event.ingredient);
    result.fold(
      (failure) => emit(InventoryError(failure.message)),
      (_) => add(LoadIngredients()), // Reload after add
    );
  }

  Future<void> _onUpdateIngredient(UpdateIngredient event, Emitter<InventoryState> emit) async {
    final result = await repository.updateIngredient(event.ingredient);
    result.fold(
      (failure) => emit(InventoryError(failure.message)),
      (_) => add(LoadIngredients()),
    );
  }

  Future<void> _onDeleteIngredient(DeleteIngredient event, Emitter<InventoryState> emit) async {
    final result = await repository.deleteIngredient(event.id);
    result.fold(
      (failure) => emit(InventoryError(failure.message)),
      (_) => add(LoadIngredients()),
    );
  }

  Future<void> _onImportStock(ImportStock event, Emitter<InventoryState> emit) async {
    final result = await repository.importStock(event.ingredientId, event.quantity, event.cost);
    result.fold(
      (failure) => emit(InventoryError(failure.message)),
      (_) => add(LoadIngredients()),
    );
  }
}
