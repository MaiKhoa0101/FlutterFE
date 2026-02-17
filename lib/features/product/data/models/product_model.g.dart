// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeItemModelAdapter extends TypeAdapter<RecipeItemModel> {
  @override
  final int typeId = 2;

  @override
  RecipeItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeItemModel(
      ingredientId: fields[0] as String,
      ingredientName: fields[1] as String,
      amount: fields[2] as double,
      unit: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeItemModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.ingredientId)
      ..writeByte(1)
      ..write(obj.ingredientName)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 1;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as String,
      name: fields[1] as String,
      price: fields[2] as double,
      category: fields[3] as String,
      description: fields[4] as String?,
      imagePath: fields[5] as String?,
      recipe: (fields[6] as List).cast<RecipeItemModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.imagePath)
      ..writeByte(6)
      ..write(obj.recipe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeItemModelImpl _$$RecipeItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeItemModelImpl(
      ingredientId: json['ingredientId'] as String,
      ingredientName: json['ingredientName'] as String,
      amount: (json['amount'] as num).toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$$RecipeItemModelImplToJson(
        _$RecipeItemModelImpl instance) =>
    <String, dynamic>{
      'ingredientId': instance.ingredientId,
      'ingredientName': instance.ingredientName,
      'amount': instance.amount,
      'unit': instance.unit,
    };

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      description: json['description'] as String?,
      imagePath: json['imagePath'] as String?,
      recipe: (json['recipe'] as List<dynamic>?)
              ?.map((e) => RecipeItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'category': instance.category,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'recipe': instance.recipe,
    };
