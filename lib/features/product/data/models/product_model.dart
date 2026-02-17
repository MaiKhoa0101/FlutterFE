import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/product.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
@HiveType(typeId: 2)
class RecipeItemModel with _$RecipeItemModel {
  const RecipeItemModel._();

  const factory RecipeItemModel({
    @HiveField(0) required String ingredientId,
    @HiveField(1) required String ingredientName,
    @HiveField(2) required double amount,
    @HiveField(3) required String unit,
  }) = _RecipeItemModel;

  factory RecipeItemModel.fromJson(Map<String, dynamic> json) => _$RecipeItemModelFromJson(json);

  // Expose adapter
  static TypeAdapter<RecipeItemModel> get adapter => RecipeItemModelAdapter();

  RecipeItem toEntity() => RecipeItem(
    ingredientId: ingredientId,
    ingredientName: ingredientName,
    amount: amount,
    unit: unit,
  );

  factory RecipeItemModel.fromEntity(RecipeItem entity) => RecipeItemModel(
    ingredientId: entity.ingredientId,
    ingredientName: entity.ingredientName,
    amount: entity.amount,
    unit: entity.unit,
  );
}

@freezed
@HiveType(typeId: 1)
class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required double price,
    @HiveField(3) required String category,
    @HiveField(4) String? description,
    @HiveField(5) String? imagePath,
    @HiveField(6) @Default([]) List<RecipeItemModel> recipe,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  // Expose adapter
  static TypeAdapter<ProductModel> get adapter => ProductModelAdapter();

  Product toEntity() => Product(
    id: id,
    name: name,
    price: price,
    category: category,
    description: description,
    imagePath: imagePath,
    recipe: recipe.map((e) => e.toEntity()).toList(),
  );

  factory ProductModel.fromEntity(Product entity) => ProductModel(
    id: entity.id,
    name: entity.name,
    price: entity.price,
    category: entity.category,
    description: entity.description,
    imagePath: entity.imagePath,
    recipe: entity.recipe.map((e) => RecipeItemModel.fromEntity(e)).toList(),
  );
}
