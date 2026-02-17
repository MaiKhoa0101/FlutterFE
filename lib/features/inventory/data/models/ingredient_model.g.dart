// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngredientModelAdapter extends TypeAdapter<IngredientModel> {
  @override
  final int typeId = 0;

  @override
  IngredientModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IngredientModel(
      id: fields[0] as String,
      name: fields[1] as String,
      unit: fields[2] as String,
      quantity: fields[3] as double,
      costPerUnit: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, IngredientModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.unit)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.costPerUnit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientModelImpl _$$IngredientModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IngredientModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
      costPerUnit: (json['costPerUnit'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$IngredientModelImplToJson(
        _$IngredientModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unit': instance.unit,
      'quantity': instance.quantity,
      'costPerUnit': instance.costPerUnit,
    };
