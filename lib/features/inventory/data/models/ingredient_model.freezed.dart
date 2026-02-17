// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IngredientModel _$IngredientModelFromJson(Map<String, dynamic> json) {
  return _IngredientModel.fromJson(json);
}

/// @nodoc
mixin _$IngredientModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get unit => throw _privateConstructorUsedError;
  @HiveField(3)
  double get quantity => throw _privateConstructorUsedError;
  @HiveField(4)
  double get costPerUnit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientModelCopyWith<IngredientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientModelCopyWith<$Res> {
  factory $IngredientModelCopyWith(
          IngredientModel value, $Res Function(IngredientModel) then) =
      _$IngredientModelCopyWithImpl<$Res, IngredientModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String unit,
      @HiveField(3) double quantity,
      @HiveField(4) double costPerUnit});
}

/// @nodoc
class _$IngredientModelCopyWithImpl<$Res, $Val extends IngredientModel>
    implements $IngredientModelCopyWith<$Res> {
  _$IngredientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? unit = null,
    Object? quantity = null,
    Object? costPerUnit = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      costPerUnit: null == costPerUnit
          ? _value.costPerUnit
          : costPerUnit // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientModelImplCopyWith<$Res>
    implements $IngredientModelCopyWith<$Res> {
  factory _$$IngredientModelImplCopyWith(_$IngredientModelImpl value,
          $Res Function(_$IngredientModelImpl) then) =
      __$$IngredientModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String unit,
      @HiveField(3) double quantity,
      @HiveField(4) double costPerUnit});
}

/// @nodoc
class __$$IngredientModelImplCopyWithImpl<$Res>
    extends _$IngredientModelCopyWithImpl<$Res, _$IngredientModelImpl>
    implements _$$IngredientModelImplCopyWith<$Res> {
  __$$IngredientModelImplCopyWithImpl(
      _$IngredientModelImpl _value, $Res Function(_$IngredientModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? unit = null,
    Object? quantity = null,
    Object? costPerUnit = null,
  }) {
    return _then(_$IngredientModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      costPerUnit: null == costPerUnit
          ? _value.costPerUnit
          : costPerUnit // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientModelImpl extends _IngredientModel {
  const _$IngredientModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.unit,
      @HiveField(3) this.quantity = 0.0,
      @HiveField(4) this.costPerUnit = 0.0})
      : super._();

  factory _$IngredientModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String unit;
  @override
  @JsonKey()
  @HiveField(3)
  final double quantity;
  @override
  @JsonKey()
  @HiveField(4)
  final double costPerUnit;

  @override
  String toString() {
    return 'IngredientModel(id: $id, name: $name, unit: $unit, quantity: $quantity, costPerUnit: $costPerUnit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.costPerUnit, costPerUnit) ||
                other.costPerUnit == costPerUnit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, unit, quantity, costPerUnit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientModelImplCopyWith<_$IngredientModelImpl> get copyWith =>
      __$$IngredientModelImplCopyWithImpl<_$IngredientModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientModelImplToJson(
      this,
    );
  }
}

abstract class _IngredientModel extends IngredientModel {
  const factory _IngredientModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String unit,
      @HiveField(3) final double quantity,
      @HiveField(4) final double costPerUnit}) = _$IngredientModelImpl;
  const _IngredientModel._() : super._();

  factory _IngredientModel.fromJson(Map<String, dynamic> json) =
      _$IngredientModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get unit;
  @override
  @HiveField(3)
  double get quantity;
  @override
  @HiveField(4)
  double get costPerUnit;
  @override
  @JsonKey(ignore: true)
  _$$IngredientModelImplCopyWith<_$IngredientModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
