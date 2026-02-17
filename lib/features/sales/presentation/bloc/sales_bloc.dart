import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:uuid/uuid.dart';

import '../../domain/entities/order.dart';
import '../../domain/repositories/sales_repository.dart';
import '../../../product/domain/entities/product.dart';
import '../../../inventory/domain/repositories/inventory_repository.dart';

part 'sales_event.dart';
part 'sales_state.dart';

@injectable
class SalesBloc extends Bloc<SalesEvent, SalesState> {
  final SalesRepository salesRepository;
  final InventoryRepository inventoryRepository;

  final List<OrderItem> _cartItems = [];

  SalesBloc(this.salesRepository, this.inventoryRepository) : super(SalesInitial()) {
    on<LoadOrders>(_onLoadOrders);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<ClearCart>(_onClearCart);
    on<CheckoutOrder>(_onCheckoutOrder);
  }

  double get _totalPrice => _cartItems.fold(0, (sum, item) => sum + item.total);

  void _emitCartState(Emitter<SalesState> emit) {
    // Luôn tạo một List mới (shallow copy) để đảm bảo Reference thay đổi
    final newList = List<OrderItem>.from(_cartItems);
    emit(SalesCartUpdated(newList, _totalPrice));
  }

  Future<void> _onLoadOrders(LoadOrders event, Emitter<SalesState> emit) async {
    emit(SalesLoading());
    final result = await salesRepository.getOrders();
    result.fold(
      (failure) => emit(SalesError(failure.message)),
      (orders) => emit(OrderHistoryLoaded(orders)),
    );
  }

  void _onAddToCart(AddToCart event, Emitter<SalesState> emit) {
    print("BLOC: Adding ${event.product.name}");

    final index = _cartItems.indexWhere((item) => item.product.id == event.product.id);

    if (index >= 0) {
      final currentItem = _cartItems[index];
      _cartItems[index] = OrderItem(
        product: currentItem.product,
        quantity: currentItem.quantity + 1,
        priceAtSale: currentItem.priceAtSale
      );
    } else {
      _cartItems.add(OrderItem(
        product: event.product,
        quantity: 1,
        priceAtSale: event.product.price
      ));
    }

    print("BLOC: Cart Size = ${_cartItems.length}");
    _emitCartState(emit);
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<SalesState> emit) {
    final index = _cartItems.indexWhere((item) => item.product.id == event.product.id);

    if (index >= 0) {
      final currentItem = _cartItems[index];
      if (currentItem.quantity > 1) {
        _cartItems[index] = OrderItem(
          product: currentItem.product,
          quantity: currentItem.quantity - 1,
          priceAtSale: currentItem.priceAtSale
        );
      } else {
        _cartItems.removeAt(index);
      }
    }
    _emitCartState(emit);
  }

  void _onClearCart(ClearCart event, Emitter<SalesState> emit) {
    _cartItems.clear();
    _emitCartState(emit);
  }

  // Thay thế toàn bộ hàm này trong file sales_bloc.dart
  Future<void> _onCheckoutOrder(CheckoutOrder event, Emitter<SalesState> emit) async {
    if (_cartItems.isEmpty) return;

    emit(SalesLoading()); // Tùy chọn: Thêm Loading state nếu xử lý chậm

    // Lưu lại tổng tiền để phục hồi state giỏ hàng nếu có lỗi
    final double currentTotal = _totalPrice;

    try {
      // ---------------------------------------------------------
      // BƯỚC 1: TÍNH TỔNG NGUYÊN LIỆU CẦN THIẾT CHO CẢ GIỎ HÀNG
      // ---------------------------------------------------------
      Map<String, double> requiredIngredients = {};

      for (var item in _cartItems) {
        final product = item.product;
        final qty = item.quantity;

        for (var recipeItem in product.recipe) {
          double totalAmountNeeded = recipeItem.amount * qty;
          if (requiredIngredients.containsKey(recipeItem.ingredientId)) {
            requiredIngredients[recipeItem.ingredientId] = requiredIngredients[recipeItem.ingredientId]! + totalAmountNeeded;
          } else {
            requiredIngredients[recipeItem.ingredientId] = totalAmountNeeded;
          }
        }
      }

      // ---------------------------------------------------------
      // BƯỚC 2: LẤY TỒN KHO HIỆN TẠI TỪ DATABASE
      // ---------------------------------------------------------
      // Dùng getIngredients (hoặc hàm tương đương bên InventoryRepository)
      // Giả sử hàm trả về Right(List<Ingredient>) nếu thành công (do dùng dartz)
      final stockResult = await inventoryRepository.getIngredients();

      // Xử lý lấy list stock hoặc báo lỗi nếu không lấy được kho
      final stockList = stockResult.fold(
              (failure) => null,
              (ingredients) => ingredients
      );

      if (stockList == null) {
        emit(const SalesError('Lỗi kết nối kho: Không thể kiểm tra tồn kho.'));
        // Phục hồi lại giỏ hàng
        emit(SalesCartUpdated(List.from(_cartItems), currentTotal));
        return;
      }

      // ---------------------------------------------------------
      // BƯỚC 3: KIỂM TRA ĐỐI CHIẾU (VALIDATION)
      // ---------------------------------------------------------
      List<String> outOfStockMessages = [];

      requiredIngredients.forEach((ingredientId, requiredQty) {
        try {
          final stockItem = stockList.firstWhere((item) => item.id == ingredientId);
          if (stockItem.quantity < requiredQty) {
            outOfStockMessages.add(
                '- ${stockItem.name}: Cần ${requiredQty.toStringAsFixed(2)} ${stockItem.unit} '
                    '(Kho còn ${stockItem.quantity.toStringAsFixed(2)} ${stockItem.unit})'
            );
          }
        } catch (e) {
          outOfStockMessages.add('- Thiếu dữ liệu nguyên liệu (ID: $ingredientId).');
        }
      });

      if (outOfStockMessages.isNotEmpty) {
        // ---> LỖI: Không đủ nguyên liệu
        emit(SalesError('KHÔNG ĐỦ NGUYÊN LIỆU:\n${outOfStockMessages.join('\n')}'));
        // Phục hồi giỏ hàng
        emit(SalesCartUpdated(List.from(_cartItems), currentTotal));
        return;
      }

      // ---------------------------------------------------------
      // BƯỚC 4: LƯU ĐƠN HÀNG VÀ TRỪ KHO (Đã Pass Validation)
      // ---------------------------------------------------------
      final order = Order(
        id: const Uuid().v4(),
        createdAt: DateTime.now(),
        items: List.from(_cartItems),
        totalPrice: currentTotal,
      );

      final saveResult = await salesRepository.createOrder(order);

      await saveResult.fold(
            (failure) async {
          emit(SalesError(failure.message));
          emit(SalesCartUpdated(List.from(_cartItems), currentTotal));
        },
            (_) async {
          // Nếu lưu đơn thành công, tiến hành trừ kho
          for (var item in _cartItems) {
            for (var recipeItem in item.product.recipe) {
              final totalAmountToDeduct = recipeItem.amount * item.quantity;
              await inventoryRepository.deductStock(recipeItem.ingredientId, totalAmountToDeduct);
            }
          }

          _cartItems.clear();
          emit(SalesCheckoutSuccess());
          _emitCartState(emit); // Reset UI giỏ hàng về 0
        },
      );

    } catch (e) {
      emit(SalesError('Lỗi hệ thống: ${e.toString()}'));
      emit(SalesCartUpdated(List.from(_cartItems), currentTotal));
    }
  }
}
