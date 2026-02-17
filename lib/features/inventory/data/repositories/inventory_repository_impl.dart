import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/ingredient.dart';
import '../../domain/repositories/inventory_repository.dart';
import '../datasources/inventory_local_data_source.dart';
import '../models/ingredient_model.dart';

@Injectable(as: InventoryRepository)
class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryLocalDataSource localDataSource;

  InventoryRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Ingredient>>> getIngredients() async {
    try {
      final models = await localDataSource.getIngredients();
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(CacheFailure('Failed to load ingredients: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> addIngredient(Ingredient ingredient) async {
    try {
      await localDataSource.addIngredient(IngredientModel.fromEntity(ingredient));
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to add ingredient: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateIngredient(Ingredient ingredient) async {
    try {
      await localDataSource.updateIngredient(IngredientModel.fromEntity(ingredient));
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to update ingredient: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteIngredient(String id) async {
    try {
      await localDataSource.deleteIngredient(id);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to delete ingredient: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> importStock(String ingredientId, double quantity, double cost) async {
    try {
      await localDataSource.importStock(ingredientId, quantity, cost);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to import stock: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deductStock(String ingredientId, double quantity) async {
    try {
      await localDataSource.deductStock(ingredientId, quantity);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to deduct stock: $e'));
    }
  }
}
