import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getProducts();
  Future<void> addProduct(ProductModel product);
  Future<void> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
}

@Injectable(as: ProductLocalDataSource)
class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  static const String boxName = 'products';

  Future<Box<ProductModel>> _openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<ProductModel>(boxName);
    }
    return Hive.box<ProductModel>(boxName);
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final box = await _openBox();
    return box.values.toList();
  }

  @override
  Future<void> addProduct(ProductModel product) async {
    final box = await _openBox();
    await box.put(product.id, product);
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    final box = await _openBox();
    await box.put(product.id, product);
  }

  @override
  Future<void> deleteProduct(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }
}
