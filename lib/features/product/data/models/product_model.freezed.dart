// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecipeItemModel _$RecipeItemModelFromJson(Map<String, dynamic> json) {
  return _RecipeItemModel.fromJson(json);
}

/// @nodoc
mixin _$RecipeItemModel {
  @HiveField(0)
  String get ingredientId => throw _privateConstructorUsedError;
  @HiveField(1)
  String get ingredientName => throw _privateConstructorUsedError;
  @HiveField(2)
  double get amount => throw _privateConstructorUsedError;
  @HiveField(3)
  String get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeItemModelCopyWith<RecipeItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeItemModelCopyWith<$Res> {
  factory $RecipeItemModelCopyWith(
          RecipeItemModel value, $Res Function(RecipeItemModel) then) =
      _$RecipeItemModelCopyWithImpl<$Res, RecipeItemModel>;
  @useResult
  $Res call(
      {@HiveField(0) String ingredientId,
      @HiveField(1) String ingredientName,
      @HiveField(2) double amount,
      @HiveField(3) String unit});
}

/// @nodoc
class _$RecipeItemModelCopyWithImpl<$Res, $Val extends RecipeItemModel>
    implements $RecipeItemModelCopyWith<$Res> {
  _$RecipeItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredientId = null,
    Object? ingredientName = null,
    Object? amount = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      ingredientId: null == ingredientId
          ? _value.ingredientId
          : ingredientId // ignore: cast_nullable_to_non_nullable
              as String,
      ingredientName: null == ingredientName
          ? _value.ingredientName
          : ingredientName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeItemModelImplCopyWith<$Res>
    implements $RecipeItemModelCopyWith<$Res> {
  factory _$$RecipeItemModelImplCopyWith(_$RecipeItemModelImpl value,
          $Res Function(_$RecipeItemModelImpl) then) =
      __$$RecipeItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String ingredientId,
      @HiveField(1) String ingredientName,
      @HiveField(2) double amount,
      @HiveField(3) String unit});
}

/// @nodoc
class __$$RecipeItemModelImplCopyWithImpl<$Res>
    extends _$RecipeItemModelCopyWithImpl<$Res, _$RecipeItemModelImpl>
    implements _$$RecipeItemModelImplCopyWith<$Res> {
  __$$RecipeItemModelImplCopyWithImpl(
      _$RecipeItemModelImpl _value, $Res Function(_$RecipeItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredientId = null,
    Object? ingredientName = null,
    Object? amount = null,
    Object? unit = null,
  }) {
    return _then(_$RecipeItemModelImpl(
      ingredientId: null == ingredientId
          ? _value.ingredientId
          : ingredientId // ignore: cast_nullable_to_non_nullable
              as String,
      ingredientName: null == ingredientName
          ? _value.ingredientName
          : ingredientName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeItemModelImpl extends _RecipeItemModel {
  const _$RecipeItemModelImpl(
      {@HiveField(0) required this.ingredientId,
      @HiveField(1) required this.ingredientName,
      @HiveField(2) required this.amount,
      @HiveField(3) required this.unit})
      : super._();

  factory _$RecipeItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeItemModelImplFromJson(json);

  @override
  @HiveField(0)
  final String ingredientId;
  @override
  @HiveField(1)
  final String ingredientName;
  @override
  @HiveField(2)
  final double amount;
  @override
  @HiveField(3)
  final String unit;

  @override
  String toString() {
    return 'RecipeItemModel(ingredientId: $ingredientId, ingredientName: $ingredientName, amount: $amount, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeItemModelImpl &&
            (identical(other.ingredientId, ingredientId) ||
                other.ingredientId == ingredientId) &&
            (identical(other.ingredientName, ingredientName) ||
                other.ingredientName == ingredientName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ingredientId, ingredientName, amount, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeItemModelImplCopyWith<_$RecipeItemModelImpl> get copyWith =>
      __$$RecipeItemModelImplCopyWithImpl<_$RecipeItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeItemModelImplToJson(
      this,
    );
  }
}

abstract class _RecipeItemModel extends RecipeItemModel {
  const factory _RecipeItemModel(
      {@HiveField(0) required final String ingredientId,
      @HiveField(1) required final String ingredientName,
      @HiveField(2) required final double amount,
      @HiveField(3) required final String unit}) = _$RecipeItemModelImpl;
  const _RecipeItemModel._() : super._();

  factory _RecipeItemModel.fromJson(Map<String, dynamic> json) =
      _$RecipeItemModelImpl.fromJson;

  @override
  @HiveField(0)
  String get ingredientId;
  @override
  @HiveField(1)
  String get ingredientName;
  @override
  @HiveField(2)
  double get amount;
  @override
  @HiveField(3)
  String get unit;
  @override
  @JsonKey(ignore: true)
  _$$RecipeItemModelImplCopyWith<_$RecipeItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  double get price => throw _privateConstructorUsedError;
  @HiveField(3)
  String get category => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get imagePath => throw _privateConstructorUsedError;
  @HiveField(6)
  List<RecipeItemModel> get recipe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) double price,
      @HiveField(3) String category,
      @HiveField(4) String? description,
      @HiveField(5) String? imagePath,
      @HiveField(6) List<RecipeItemModel> recipe});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? category = null,
    Object? description = freezed,
    Object? imagePath = freezed,
    Object? recipe = null,
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
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as List<RecipeItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) double price,
      @HiveField(3) String category,
      @HiveField(4) String? description,
      @HiveField(5) String? imagePath,
      @HiveField(6) List<RecipeItemModel> recipe});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? category = null,
    Object? description = freezed,
    Object? imagePath = freezed,
    Object? recipe = null,
  }) {
    return _then(_$ProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      recipe: null == recipe
          ? _value._recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as List<RecipeItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl extends _ProductModel {
  const _$ProductModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.price,
      @HiveField(3) required this.category,
      @HiveField(4) this.description,
      @HiveField(5) this.imagePath,
      @HiveField(6) final List<RecipeItemModel> recipe = const []})
      : _recipe = recipe,
        super._();

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final double price;
  @override
  @HiveField(3)
  final String category;
  @override
  @HiveField(4)
  final String? description;
  @override
  @HiveField(5)
  final String? imagePath;
  final List<RecipeItemModel> _recipe;
  @override
  @JsonKey()
  @HiveField(6)
  List<RecipeItemModel> get recipe {
    if (_recipe is EqualUnmodifiableListView) return _recipe;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipe);
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, price: $price, category: $category, description: $description, imagePath: $imagePath, recipe: $recipe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality().equals(other._recipe, _recipe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, category,
      description, imagePath, const DeepCollectionEquality().hash(_recipe));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel extends ProductModel {
  const factory _ProductModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final double price,
      @HiveField(3) required final String category,
      @HiveField(4) final String? description,
      @HiveField(5) final String? imagePath,
      @HiveField(6) final List<RecipeItemModel> recipe}) = _$ProductModelImpl;
  const _ProductModel._() : super._();

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  double get price;
  @override
  @HiveField(3)
  String get category;
  @override
  @HiveField(4)
  String? get description;
  @override
  @HiveField(5)
  String? get imagePath;
  @override
  @HiveField(6)
  List<RecipeItemModel> get recipe;
  @override
  @JsonKey(ignore: true)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
