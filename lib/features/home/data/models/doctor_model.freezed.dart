// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) {
  return _DoctorModel.fromJson(json);
}

/// @nodoc
mixin _$DoctorModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get avatarURL => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  SpecialtyModel? get specialty => throw _privateConstructorUsedError;
  int? get experience => throw _privateConstructorUsedError;
  int? get ratingsCount => throw _privateConstructorUsedError;
  int? get patientsCount => throw _privateConstructorUsedError;

  /// Serializes this DoctorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorModelCopyWith<DoctorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorModelCopyWith<$Res> {
  factory $DoctorModelCopyWith(
          DoctorModel value, $Res Function(DoctorModel) then) =
      _$DoctorModelCopyWithImpl<$Res, DoctorModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String email,
      String phone,
      String address,
      String? avatarURL,
      String? description,
      SpecialtyModel? specialty,
      int? experience,
      int? ratingsCount,
      int? patientsCount});

  $SpecialtyModelCopyWith<$Res>? get specialty;
}

/// @nodoc
class _$DoctorModelCopyWithImpl<$Res, $Val extends DoctorModel>
    implements $DoctorModelCopyWith<$Res> {
  _$DoctorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? avatarURL = freezed,
    Object? description = freezed,
    Object? specialty = freezed,
    Object? experience = freezed,
    Object? ratingsCount = freezed,
    Object? patientsCount = freezed,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      avatarURL: freezed == avatarURL
          ? _value.avatarURL
          : avatarURL // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      specialty: freezed == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as SpecialtyModel?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingsCount: freezed == ratingsCount
          ? _value.ratingsCount
          : ratingsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      patientsCount: freezed == patientsCount
          ? _value.patientsCount
          : patientsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of DoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpecialtyModelCopyWith<$Res>? get specialty {
    if (_value.specialty == null) {
      return null;
    }

    return $SpecialtyModelCopyWith<$Res>(_value.specialty!, (value) {
      return _then(_value.copyWith(specialty: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DoctorModelImplCopyWith<$Res>
    implements $DoctorModelCopyWith<$Res> {
  factory _$$DoctorModelImplCopyWith(
          _$DoctorModelImpl value, $Res Function(_$DoctorModelImpl) then) =
      __$$DoctorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String email,
      String phone,
      String address,
      String? avatarURL,
      String? description,
      SpecialtyModel? specialty,
      int? experience,
      int? ratingsCount,
      int? patientsCount});

  @override
  $SpecialtyModelCopyWith<$Res>? get specialty;
}

/// @nodoc
class __$$DoctorModelImplCopyWithImpl<$Res>
    extends _$DoctorModelCopyWithImpl<$Res, _$DoctorModelImpl>
    implements _$$DoctorModelImplCopyWith<$Res> {
  __$$DoctorModelImplCopyWithImpl(
      _$DoctorModelImpl _value, $Res Function(_$DoctorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? avatarURL = freezed,
    Object? description = freezed,
    Object? specialty = freezed,
    Object? experience = freezed,
    Object? ratingsCount = freezed,
    Object? patientsCount = freezed,
  }) {
    return _then(_$DoctorModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      avatarURL: freezed == avatarURL
          ? _value.avatarURL
          : avatarURL // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      specialty: freezed == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as SpecialtyModel?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingsCount: freezed == ratingsCount
          ? _value.ratingsCount
          : ratingsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      patientsCount: freezed == patientsCount
          ? _value.patientsCount
          : patientsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorModelImpl extends _DoctorModel {
  const _$DoctorModelImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      this.avatarURL,
      this.description,
      this.specialty,
      this.experience,
      this.ratingsCount,
      this.patientsCount})
      : super._();

  factory _$DoctorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String address;
  @override
  final String? avatarURL;
  @override
  final String? description;
  @override
  final SpecialtyModel? specialty;
  @override
  final int? experience;
  @override
  final int? ratingsCount;
  @override
  final int? patientsCount;

  @override
  String toString() {
    return 'DoctorModel(id: $id, name: $name, email: $email, phone: $phone, address: $address, avatarURL: $avatarURL, description: $description, specialty: $specialty, experience: $experience, ratingsCount: $ratingsCount, patientsCount: $patientsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.avatarURL, avatarURL) ||
                other.avatarURL == avatarURL) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.ratingsCount, ratingsCount) ||
                other.ratingsCount == ratingsCount) &&
            (identical(other.patientsCount, patientsCount) ||
                other.patientsCount == patientsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      phone,
      address,
      avatarURL,
      description,
      specialty,
      experience,
      ratingsCount,
      patientsCount);

  /// Create a copy of DoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorModelImplCopyWith<_$DoctorModelImpl> get copyWith =>
      __$$DoctorModelImplCopyWithImpl<_$DoctorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorModelImplToJson(
      this,
    );
  }
}

abstract class _DoctorModel extends DoctorModel {
  const factory _DoctorModel(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final String email,
      required final String phone,
      required final String address,
      final String? avatarURL,
      final String? description,
      final SpecialtyModel? specialty,
      final int? experience,
      final int? ratingsCount,
      final int? patientsCount}) = _$DoctorModelImpl;
  const _DoctorModel._() : super._();

  factory _DoctorModel.fromJson(Map<String, dynamic> json) =
      _$DoctorModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get address;
  @override
  String? get avatarURL;
  @override
  String? get description;
  @override
  SpecialtyModel? get specialty;
  @override
  int? get experience;
  @override
  int? get ratingsCount;
  @override
  int? get patientsCount;

  /// Create a copy of DoctorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorModelImplCopyWith<_$DoctorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpecialtyModel _$SpecialtyModelFromJson(Map<String, dynamic> json) {
  return _SpecialtyModel.fromJson(json);
}

/// @nodoc
mixin _$SpecialtyModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this SpecialtyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpecialtyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecialtyModelCopyWith<SpecialtyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialtyModelCopyWith<$Res> {
  factory $SpecialtyModelCopyWith(
          SpecialtyModel value, $Res Function(SpecialtyModel) then) =
      _$SpecialtyModelCopyWithImpl<$Res, SpecialtyModel>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String name, String? image});
}

/// @nodoc
class _$SpecialtyModelCopyWithImpl<$Res, $Val extends SpecialtyModel>
    implements $SpecialtyModelCopyWith<$Res> {
  _$SpecialtyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecialtyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecialtyModelImplCopyWith<$Res>
    implements $SpecialtyModelCopyWith<$Res> {
  factory _$$SpecialtyModelImplCopyWith(_$SpecialtyModelImpl value,
          $Res Function(_$SpecialtyModelImpl) then) =
      __$$SpecialtyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String name, String? image});
}

/// @nodoc
class __$$SpecialtyModelImplCopyWithImpl<$Res>
    extends _$SpecialtyModelCopyWithImpl<$Res, _$SpecialtyModelImpl>
    implements _$$SpecialtyModelImplCopyWith<$Res> {
  __$$SpecialtyModelImplCopyWithImpl(
      _$SpecialtyModelImpl _value, $Res Function(_$SpecialtyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpecialtyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
  }) {
    return _then(_$SpecialtyModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecialtyModelImpl extends _SpecialtyModel {
  const _$SpecialtyModelImpl(
      {@JsonKey(name: '_id') required this.id, required this.name, this.image})
      : super._();

  factory _$SpecialtyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecialtyModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String? image;

  @override
  String toString() {
    return 'SpecialtyModel(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialtyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  /// Create a copy of SpecialtyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialtyModelImplCopyWith<_$SpecialtyModelImpl> get copyWith =>
      __$$SpecialtyModelImplCopyWithImpl<_$SpecialtyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecialtyModelImplToJson(
      this,
    );
  }
}

abstract class _SpecialtyModel extends SpecialtyModel {
  const factory _SpecialtyModel(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      final String? image}) = _$SpecialtyModelImpl;
  const _SpecialtyModel._() : super._();

  factory _SpecialtyModel.fromJson(Map<String, dynamic> json) =
      _$SpecialtyModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String? get image;

  /// Create a copy of SpecialtyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecialtyModelImplCopyWith<_$SpecialtyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
