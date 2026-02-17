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
    // Lưu lại công thức để tính tồn kho lịch sử nếu cần, hoặc đơn giản là snapshot
    // Để đơn giản cho Hive, ta không lưu full ProductModel nested quá sâu nếu không cần thiết.
    // Tuy nhiên, để mapping lại Entity, ta cần Product entity.
    // Trong thực tế, Order chỉ cần hiển thị tên và giá.
    // Nhưng để Clean Architecture, ta sẽ map tạm.
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);
  
  static TypeAdapter<OrderItemModel> get adapter => OrderItemModelAdapter();

  // Mapping from Entity
  factory OrderItemModel.fromEntity(OrderItem entity) => OrderItemModel(
    productId: entity.product.id,
    productName: entity.product.name,
    priceAtSale: entity.priceAtSale,
    quantity: entity.quantity,
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

  // Mapping to Entity:
  // Lưu ý: Khi convert ngược từ DB ra Entity, ta bị thiếu object "Product" đầy đủ (ví dụ thiếu recipe).
  // Với màn hình lịch sử đơn hàng, ta chỉ cần hiển thị tên và giá, không cần recipe.
  // Nên ta sẽ tạo một Product "dummy" từ thông tin snapshot.
  Order toEntity() => Order(
    id: id,
    createdAt: createdAt,
    items: items.map((e) => OrderItem(
      product: Product(
        id: e.productId, 
        name: e.productName, 
        price: e.priceAtSale, 
        category: 'History', // Dummy category
        recipe: [], // Không cần recipe khi xem lịch sử
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
