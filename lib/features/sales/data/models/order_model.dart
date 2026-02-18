import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../../../product/data/models/product_model.dart';
import '../../../product/domain/entities/product.dart';
import '../../domain/entities/order.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
@HiveType(typeId: 3)
class OrderItemModel with _$OrderItemModel {
  const OrderItemModel._();

  const factory OrderItemModel({
    @HiveField(0) required String productId,
    @HiveField(1) required String productName,
    @HiveField(2) required double priceAtSale,
    @HiveField(3) required int quantity,
    // THÊM: Lưu công thức tại thời điểm bán để tính giá vốn sau này
    @HiveField(4) List<RecipeItemModel>? recipeSnapshot,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);
  
  static TypeAdapter<OrderItemModel> get adapter => OrderItemModelAdapter();

  factory OrderItemModel.fromEntity(OrderItem entity) => OrderItemModel(
    productId: entity.product.id,
    productName: entity.product.name,
    priceAtSale: entity.priceAtSale,
    quantity: entity.quantity,
    recipeSnapshot: entity.product.recipe.map((r) => RecipeItemModel.fromEntity(r)).toList(),
  );
}

@freezed
@HiveType(typeId: 4)
class OrderModel with _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    @HiveField(0) required String id,
    @HiveField(1) required DateTime createdAt,
    @HiveField(2) required List<OrderItemModel> items,
    @HiveField(3) required double totalPrice,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

  static TypeAdapter<OrderModel> get adapter => OrderModelAdapter();

  Order toEntity() => Order(
    id: id,
    createdAt: createdAt,
    items: items.map((e) => OrderItem(
      product: Product(
        id: e.productId, 
        name: e.productName, 
        price: e.priceAtSale, 
        category: 'History', 
        // Handle null recipeSnapshot
        recipe: e.recipeSnapshot?.map((r) => r.toEntity()).toList() ?? [],
      ), 
      quantity: e.quantity, 
      priceAtSale: e.priceAtSale
    )).toList(),
    totalPrice: totalPrice,
  );

  factory OrderModel.fromEntity(Order entity) => OrderModel(
    id: entity.id,
    createdAt: entity.createdAt,
    items: entity.items.map((e) => OrderItemModel.fromEntity(e)).toList(),
    totalPrice: entity.totalPrice,
  );
}
