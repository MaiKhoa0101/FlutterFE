import 'package:equatable/equatable.dart';

class Specialty extends Equatable {
  final String id;
  final String name;
  final String? image;

  const Specialty({
    required this.id,
    required this.name,
    this.image,
  });

  @override
  List<Object?> get props => [id, name, image];
}
