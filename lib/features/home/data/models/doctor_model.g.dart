// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorModelImpl _$$DoctorModelImplFromJson(Map<String, dynamic> json) =>
    _$DoctorModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      avatarURL: json['avatarURL'] as String?,
      description: json['description'] as String?,
      specialty: json['specialty'] == null
          ? null
          : SpecialtyModel.fromJson(json['specialty'] as Map<String, dynamic>),
      experience: (json['experience'] as num?)?.toInt(),
      ratingsCount: (json['ratingsCount'] as num?)?.toInt(),
      patientsCount: (json['patientsCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DoctorModelImplToJson(_$DoctorModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'avatarURL': instance.avatarURL,
      'description': instance.description,
      'specialty': instance.specialty,
      'experience': instance.experience,
      'ratingsCount': instance.ratingsCount,
      'patientsCount': instance.patientsCount,
    };

_$SpecialtyModelImpl _$$SpecialtyModelImplFromJson(Map<String, dynamic> json) =>
    _$SpecialtyModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$SpecialtyModelImplToJson(
        _$SpecialtyModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
