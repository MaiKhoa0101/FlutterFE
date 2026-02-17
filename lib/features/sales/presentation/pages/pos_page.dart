import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../product/presentation/bloc/product_bloc.dart';
import '../../domain/entities/order.dart';
import '../bloc/sales_bloc.dart';

class PosPage extends StatelessWidget {
  const PosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ProductBloc>()..add(LoadProducts())),
        BlocProvider(create: (context) => getIt<SalesBloc>()),
      ],
      child: const PosView(),
    );
  }
}

class PosView extends StatelessWidget {
  const PosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Bán Hàng'),
      ),
      body: Stack(
        children: [
          const Positioned.fill(
            child: ProductGrid(),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CartSummaryBar(),
          ),
        ],
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) return const Center(child: CircularProgressIndicator());
        if (state is ProductLoaded) {
          if (state.products.isEmpty) {
            return const Center(child: Text("Chưa có món nào."));
          }
          return GridView.builder(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return Card(
                elevation: 4,
                shadowColor: Colors.pink.withOpacity(0.2),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    context.read<SalesBloc>().add(AddToCart(product));
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Đã thêm ${product.name}'),
                        backgroundColor: Colors.pink,
                        duration: const Duration(milliseconds: 500),
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.only(bottom: 80, left: 20, right: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow[50],
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          child: Icon(Icons.coffee_rounded, size: 50, color: Colors.orange[300]),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey[800]),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${product.price.toInt()}đ',
                                    style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.w800, fontSize: 16),
                                  ),
                                  const Icon(Icons.add_circle, color: Colors.amber, size: 28),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class CartSummaryBar extends StatelessWidget {
  const CartSummaryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesBloc, SalesState>(
      listener: (context, state) {
        if (state is SalesCheckoutSuccess) {
          showDialog(
            context: context,
            builder: (dialogContext) => AlertDialog(
              title: const Text("Thành công", style: TextStyle(color: Colors.pink)),
              content: const Text("Đã thanh toán xong!"),
              icon: const Icon(Icons.check_circle, color: Colors.green, size: 50),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    child: const Text("OK", style: TextStyle(color: Colors.pink))
                )
              ],
            ),
          );
        } else if (state is SalesError) { // Bắt state lỗi ở đây
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message, style: const TextStyle(fontWeight: FontWeight.bold)),
              backgroundColor: Colors.red[700],
              duration: const Duration(seconds: 4),
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.only(bottom: 80, left: 16, right: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              action: SnackBarAction(
                label: 'Đóng',
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        double total = 0;
        int itemCount = 0;

        if (state is SalesCartUpdated) {
          total = state.total;
          itemCount = state.cartItems.fold(0, (sum, item) => sum + item.quantity);
        }

        if (itemCount == 0) return const SizedBox.shrink();

        return GestureDetector(
          onTap: () => _showCartBottomSheet(context),
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFE91E63), Color(0xFFFF4081)]),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(color: Colors.pink.withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 5)),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
                      child: Text(
                        '$itemCount',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${total.toInt()} đ', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                        const Text('Xem giỏ hàng', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                const Icon(Icons.keyboard_arrow_up_rounded, color: Colors.white, size: 28),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showCartBottomSheet(BuildContext parentContext) {
    showModalBottomSheet(
      context: parentContext,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return BlocProvider.value(
          value: parentContext.read<SalesBloc>(),
          child: const CartBottomSheet(),
        );
      },
    );
  }
}

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesBloc, SalesState>(
      builder: (context, state) {
        List<OrderItem> cartItems = [];
        double total = 0;

        if (state is SalesCartUpdated) {
          cartItems = state.cartItems;
          total = state.total;
        }

        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 40, height: 5,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2.5)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Giỏ hàng của bạn', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFE91E63))),
                  TextButton.icon(
                    onPressed: () {
                      context.read<SalesBloc>().add(ClearCart());
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.delete_outline, size: 20),
                    label: const Text('Xóa hết'),
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                  )
                ],
              ),
              const Divider(),
              Expanded(
                child: cartItems.isEmpty
                    ? const Center(child: Text("Giỏ hàng trống"))
                    : ListView.separated(
                  itemCount: cartItems.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.pink[50],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60, height: 60,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                            child: const Icon(Icons.coffee, color: Colors.orange),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Text('${item.product.price.toInt()} đ', style: const TextStyle(color: Colors.grey)),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    _QuantityBtn(
                                        icon: Icons.remove,
                                        onTap: () => context.read<SalesBloc>().add(RemoveFromCart(item.product))
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Text('${item.quantity}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    ),
                                    _QuantityBtn(
                                        icon: Icons.add,
                                        onTap: () => context.read<SalesBloc>().add(AddToCart(item.product))
                                    ),
                                    const Spacer(),
                                    Text('${item.total.toInt()} đ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFFE91E63))),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107),
                      foregroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                    ),
                    onPressed: cartItems.isEmpty ? null : () {
                      // Gửi event thanh toán
                      context.read<SalesBloc>().add(CheckoutOrder());
                      // Đóng BottomSheet ngay lập tức, phần thông báo lỗi/thành công sẽ do listener ở ngoài lo
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('THANH TOÁN', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                        Text('${total.toInt()} đ', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _QuantityBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QuantityBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2)),
          ],
        ),
        child: Icon(icon, size: 18, color: Colors.pink),
      ),
    );
  }
}