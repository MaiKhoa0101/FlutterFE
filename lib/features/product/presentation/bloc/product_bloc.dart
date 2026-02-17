import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

@lazySingleton
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<AddProduct>(_onAddProduct);
    on<UpdateProduct>(_onUpdateProduct);
    on<DeleteProduct>(_onDeleteProduct);
  }

  Future<void> _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    final result = await repository.getProducts();
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (products) => emit(ProductLoaded(products)),
    );
  }

  Future<void> _onAddProduct(AddProduct event, Emitter<ProductState> emit) async {
    final result = await repository.addProduct(event.product);
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (_) => add(LoadProducts()),
    );
  }

  Future<void> _onUpdateProduct(UpdateProduct event, Emitter<ProductState> emit) async {
    final result = await repository.updateProduct(event.product);
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (_) => add(LoadProducts()),
    );
  }

  Future<void> _onDeleteProduct(DeleteProduct event, Emitter<ProductState> emit) async {
    final result = await repository.deleteProduct(event.id);
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (_) => add(LoadProducts()),
    );
  }

  // Prevent closing the singleton bloc
  @override
  Future<void> close() async {
    // Do nothing or log
    // super.close(); // Comment this line to keep singleton alive
    return;
  }
}
