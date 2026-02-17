import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/ingredient.dart';

abstract class InventoryRepository {
  Future<Either<Failure, List<Ingredient>>> getIngredients();
  Future<Either<Failure, void>> addIngredient(Ingredient ingredient);
  Future<Either<Failure, void>> updateIngredient(Ingredient ingredient);
  Future<Either<Failure, void>> deleteIngredient(String id);
  Future<Either<Failure, void>> importStock(String ingredientId, double quantity, double cost);
  Future<Either<Failure, void>> deductStock(String ingredientId, double quantity);
}
