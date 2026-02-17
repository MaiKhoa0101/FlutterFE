import 'package:equatable/equatable.dart';

import 'specialty.dart';

class Doctor extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String? avatarUrl;
  final String? description;
  final Specialty? specialty;
  final int? experience;
  final double rating;
  final int patientsCount;

  const Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    this.avatarUrl,
    this.description,
    this.specialty,
    this.experience,
    this.rating = 0.0,
    this.patientsCount = 0,
  });

  @override
  List<Object?> get props => [id, name, email];
}
