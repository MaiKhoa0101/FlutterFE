import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/ingredient.dart';

part 'ingredient_model.freezed.dart';
part 'ingredient_model.g.dart';

@freezed
@HiveType(typeId: 0) // Hive Adapter ID = 0
class IngredientModel with _$IngredientModel {
  const IngredientModel._(); // Allow adding methods

  const factory IngredientModel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String unit,
    @HiveField(3) @Default(0.0) double quantity,
    @HiveField(4) @Default(0.0) double costPerUnit,
  }) = _IngredientModel;

  factory IngredientModel.fromJson(Map<String, dynamic> json) => _$IngredientModelFromJson(json);

  // Expose Adapter statically
  static TypeAdapter<IngredientModel> get adapter => IngredientModelAdapter();

  // Map to Entity
  Ingredient toEntity() => Ingredient(
    id: id,
    name: name,
    unit: unit,
    quantity: quantity,
    costPerUnit: costPerUnit,
  );

  // Map from Entity
  factory IngredientModel.fromEntity(Ingredient entity) => IngredientModel(
    id: entity.id,
    name: entity.name,
    unit: entity.unit,
    quantity: entity.quantity,
    costPerUnit: entity.costPerUnit,
  );
}
