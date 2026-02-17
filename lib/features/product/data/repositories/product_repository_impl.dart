import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../models/product_model.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final models = await localDataSource.getProducts();
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(CacheFailure('Failed to load products: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> addProduct(Product product) async {
    try {
      await localDataSource.addProduct(ProductModel.fromEntity(product));
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to add product: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(Product product) async {
    try {
      await localDataSource.updateProduct(ProductModel.fromEntity(product));
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to update product: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    try {
      await localDataSource.deleteProduct(id);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to delete product: $e'));
    }
  }
}
