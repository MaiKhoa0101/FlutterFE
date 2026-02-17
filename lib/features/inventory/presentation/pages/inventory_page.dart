import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/ingredient.dart';
import '../bloc/inventory_bloc.dart';
// 1. Đổi thành StatefulWidget
class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {

  // 2. Gọi event load dữ liệu mỗi khi mở trang
  @override
  void initState() {
    super.initState();
    // Thay 'LoadIngredients()' bằng tên event thực tế trong file inventory_bloc.dart của bạn
    context.read<InventoryBloc>().add(LoadIngredients());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Kho nguyên liệu')),
        body: BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state) {
          if (state is InventoryLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is InventoryError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is InventoryLoaded) {
            if (state.ingredients.isEmpty) {
              return const Center(child: Text('Chưa có nguyên liệu nào.'));
            }
            return ListView.builder(
              itemCount: state.ingredients.length,
              itemBuilder: (context, index) {
                final ingredient = state.ingredients[index];
                return ListTile(
                  title: Text(ingredient.name),
                  subtitle: Text('Tồn: ${ingredient.quantity} ${ingredient.unit} - Giá vốn: ${ingredient.costPerUnit}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        // Truyền context của InventoryPage (nơi có BlocProvider) vào hàm
                        onPressed: () => _showImportDialog(context, ingredient),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => context.read<InventoryBloc>().add(DeleteIngredient(ingredient.id)),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Truyền context của InventoryPage
        onPressed: () => _showAddDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext parentContext) {
    final nameController = TextEditingController();
    final unitController = TextEditingController();
    
    // Lấy Bloc từ parent context trước khi mở dialog
    final inventoryBloc = parentContext.read<InventoryBloc>();

    showDialog(
      context: parentContext,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Thêm nguyên liệu mới'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Tên nguyên liệu')),
            TextField(controller: unitController, decoration: const InputDecoration(labelText: 'Đơn vị (kg, l, hộp...)')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              final ingredient = Ingredient(
                id: const Uuid().v4(),
                name: nameController.text,
                unit: unitController.text,
              );
              // Sử dụng instance bloc đã lấy từ trước, không dùng context.read bên trong dialog
              inventoryBloc.add(AddIngredient(ingredient));
              Navigator.pop(dialogContext);
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  void _showImportDialog(BuildContext parentContext, Ingredient ingredient) {
    final qtyController = TextEditingController();
    final costController = TextEditingController();
    
    // Lấy Bloc từ parent context
    final inventoryBloc = parentContext.read<InventoryBloc>();

    showDialog(
      context: parentContext,
      builder: (dialogContext) => AlertDialog(
        title: Text('Nhập kho: ${ingredient.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: qtyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Số lượng nhập (${ingredient.unit})'),
            ),
            TextField(
              controller: costController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Giá nhập (VNĐ)'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              final qty = double.tryParse(qtyController.text) ?? 0;
              final cost = double.tryParse(costController.text) ?? 0;
              
              // Sử dụng instance bloc đã lấy
              inventoryBloc.add(ImportStock(ingredient.id, qty, cost));
              Navigator.pop(dialogContext);
            },
            child: const Text('Nhập kho'),
          ),
        ],
      ),
    );
  }
}
