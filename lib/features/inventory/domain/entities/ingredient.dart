import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  final String id;
  final String name;
  final String unit;
  final double quantity; // Tồn kho hiện tại
  final double costPerUnit; // Giá vốn trung bình

  const Ingredient({
    required this.id,
    required this.name,
    required this.unit,
    this.quantity = 0.0,
    this.costPerUnit = 0.0,
  });

  @override
  List<Object?> get props => [id, name, unit, quantity, costPerUnit];
}
