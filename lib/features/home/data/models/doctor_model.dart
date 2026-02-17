import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/doctor.dart';
import '../../domain/entities/specialty.dart';

part 'doctor_model.freezed.dart';
part 'doctor_model.g.dart';

@freezed
class DoctorModel with _$DoctorModel {
  const DoctorModel._();

  const factory DoctorModel({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String email,
    required String phone,
    required String address,
    String? avatarURL,
    String? description,
    SpecialtyModel? specialty,
    int? experience,
    int? ratingsCount,
    int? patientsCount,
  }) = _DoctorModel;

  factory DoctorModel.fromJson(Map<String, dynamic> json) => _$DoctorModelFromJson(json);

  Doctor toEntity() => Doctor(
    id: id,
    name: name,
    email: email,
    phone: phone,
    address: address,
    avatarUrl: avatarURL,
    description: description,
    specialty: specialty?.toEntity(),
    experience: experience,
    patientsCount: patientsCount ?? 0,
    rating: (ratingsCount ?? 0).toDouble(), // Simplification
  );
}

@freezed
class SpecialtyModel with _$SpecialtyModel {
  const SpecialtyModel._();

  const factory SpecialtyModel({
    @JsonKey(name: '_id') required String id,
    required String name,
    String? image,
  }) = _SpecialtyModel;

  factory SpecialtyModel.fromJson(Map<String, dynamic> json) => _$SpecialtyModelFromJson(json);

  Specialty toEntity() => Specialty(id: id, name: name, image: image);
}
