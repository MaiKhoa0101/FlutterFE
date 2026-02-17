import 'package:equatable/equatable.dart';

class RecipeItem extends Equatable {
  final String ingredientId;
  final String ingredientName; // Cache tên để hiển thị nhanh
  final double amount; // Định lượng (vd: 50g, 20ml)
  final String unit; // Đơn vị tính

  const RecipeItem({
    required this.ingredientId,
    required this.ingredientName,
    required this.amount,
    required this.unit,
  });

  @override
  List<Object?> get props => [ingredientId, ingredientName, amount, unit];
}

class Product extends Equatable {
  final String id;
  final String name;
  final double price;
  final String category; // Trà, Cafe, Sinh tố...
  final String? description; // Cách chế biến
  final String? imagePath;
  final List<RecipeItem> recipe;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    this.description,
    this.imagePath,
    this.recipe = const [],
  });

  @override
  List<Object?> get props => [id, name, price, category, description, imagePath, recipe];
}
