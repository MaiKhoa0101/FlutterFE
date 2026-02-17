import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../models/ingredient_model.dart';

abstract class InventoryLocalDataSource {
  Future<List<IngredientModel>> getIngredients();
  Future<void> addIngredient(IngredientModel ingredient);
  Future<void> updateIngredient(IngredientModel ingredient);
  Future<void> deleteIngredient(String id);
  Future<void> importStock(String id, double quantity, double cost);
  Future<void> deductStock(String id, double quantity);
}

@Injectable(as: InventoryLocalDataSource)
class InventoryLocalDataSourceImpl implements InventoryLocalDataSource {
  // Box name constant
  static const String boxName = 'ingredients';

  Future<Box<IngredientModel>> _openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<IngredientModel>(boxName);
    }
    return Hive.box<IngredientModel>(boxName);
  }

  @override
  Future<List<IngredientModel>> getIngredients() async {
    final box = await _openBox();
    return box.values.toList();
  }

  @override
  Future<void> addIngredient(IngredientModel ingredient) async {
    final box = await _openBox();
    await box.put(ingredient.id, ingredient);
  }

  @override
  Future<void> updateIngredient(IngredientModel ingredient) async {
    final box = await _openBox();
    await box.put(ingredient.id, ingredient);
  }

  @override
  Future<void> deleteIngredient(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }
  @override
  Future<void> importStock(String id, double quantity, double cost) async {
    final box = await _openBox();
    final current = box.get(id);

    if (current != null) {
      double newQuantity = current.quantity + quantity;

      // Mặc định giữ nguyên giá vốn cũ nếu nhập giá = 0
      double newCostPerUnit = current.costPerUnit;

      // Chỉ tính lại giá vốn trung bình nếu thực sự có nhập đơn giá mới (> 0)
      if (cost > 0 && newQuantity > 0) {
        double totalOldValue = current.quantity * current.costPerUnit;
        double totalNewValue = quantity * cost;
        newCostPerUnit = (totalOldValue + totalNewValue) / newQuantity;
      } else if (current.quantity == 0 && cost > 0) {
        // Trường hợp kho đang trống và nhập hàng có giá
        newCostPerUnit = cost;
      }

      final updated = current.copyWith(
        quantity: newQuantity,
        costPerUnit: newCostPerUnit,
      );
      await box.put(id, updated);
    }
  }
  @override
  Future<void> deductStock(String id, double quantity) async {
    final box = await _openBox();
    final current = box.get(id);
    if (current != null) {
      // Khi xuất kho, giá vốn không đổi, chỉ giảm số lượng
      double newQuantity = current.quantity - quantity;
      if (newQuantity < 0) newQuantity = 0; // Không cho âm kho (hoặc cho phép tùy logic)

      final updated = current.copyWith(quantity: newQuantity);
      await box.put(id, updated);
    }
  }
}
