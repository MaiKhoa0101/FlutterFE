import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/ingredient.dart';
import '../bloc/inventory_bloc.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  void initState() {
    super.initState();
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
            return Center(child: Text('Lỗi: ${state.message}'));
          }
          if (state is InventoryLoaded) {
            if (state.ingredients.isEmpty) {
              return const Center(child: Text('Chưa có nguyên liệu nào.'));
            }
            return ListView.separated(
              itemCount: state.ingredients.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final ingredient = state.ingredients[index];

                // Hiển thị số lượng: Nếu là số chẵn (vd: 5.0) thì bỏ .0
                final String qtyDisplay = ingredient.quantity % 1 == 0
                    ? ingredient.quantity.toInt().toString()
                    : ingredient.quantity.toStringAsFixed(2);

                // Hiển thị giá vốn: Bỏ số thập phân, ép về int
                final String costDisplay = ingredient.costPerUnit.toInt().toString();

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  title: Text(
                      ingredient.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tồn: $qtyDisplay ${ingredient.unit}', style: TextStyle(color: Colors.grey[800])),
                        const SizedBox(width: 16),
                        Text('Vốn trung bình: $costDisplay đ/${ingredient.unit}', style: const TextStyle(color: Colors.pink)),
                      ],
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add_circle, color: Colors.green),
                        onPressed: () => _showImportDialog(context, ingredient),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.red),
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
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        onPressed: () => _showAddDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext parentContext) {
    final nameController = TextEditingController();
    final unitController = TextEditingController();
    final inventoryBloc = parentContext.read<InventoryBloc>();

    showDialog(
      context: parentContext,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Thêm nguyên liệu mới'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Tên nguyên liệu')
            ),
            TextField(
                controller: unitController,
                decoration: const InputDecoration(labelText: 'Đơn vị (kg, lít, hộp...)')
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isEmpty || unitController.text.isEmpty) return;
              final ingredient = Ingredient(
                id: const Uuid().v4(),
                name: nameController.text,
                unit: unitController.text,
              );
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
    final inventoryBloc = parentContext.read<InventoryBloc>();

    showDialog(
      context: parentContext,
      builder: (dialogContext) => AlertDialog(
        title: Text('Nhập kho: ${ingredient.name}', style: const TextStyle(color: Colors.pink)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: qtyController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Số lượng nhập thêm',
                suffixText: ingredient.unit,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: costController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Đơn giá 1 ${ingredient.unit} (VNĐ)',
                hintText: 'Để trống để giữ nguyên giá vốn',
                hintStyle: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('Hủy')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
            onPressed: () {
              final qty = double.tryParse(qtyController.text) ?? 0;
              final cost = double.tryParse(costController.text) ?? 0;

              if (qty > 0) {
                inventoryBloc.add(ImportStock(ingredient.id, qty, cost));
              }
              Navigator.pop(dialogContext);
            },
            child: const Text('Nhập kho'),
          ),
        ],
      ),
    );
  }
}