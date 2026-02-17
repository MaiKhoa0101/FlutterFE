import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/di/injection.dart';
import '../../../inventory/presentation/bloc/inventory_bloc.dart';
import '../../domain/entities/product.dart';
import '../bloc/product_bloc.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descController = TextEditingController();
  
  final List<RecipeItem> _recipe = [];

  @override
  Widget build(BuildContext context) {
    // Cần provide InventoryBloc để chọn nguyên liệu
    return BlocProvider(
      create: (context) => getIt<InventoryBloc>()..add(LoadIngredients()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Thêm món mới')),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Tên món'),
                  validator: (v) => v!.isEmpty ? 'Nhập tên món' : null,
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: 'Giá bán (VNĐ)'),
                  keyboardType: TextInputType.number,
                  validator: (v) => v!.isEmpty ? 'Nhập giá bán' : null,
                ),
                TextFormField(
                  controller: _categoryController,
                  decoration: const InputDecoration(labelText: 'Danh mục (Trà, Cafe...)'),
                ),
                TextFormField(
                  controller: _descController,
                  decoration: const InputDecoration(labelText: 'Mô tả / Cách chế biến'),
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                const Text('Công thức pha chế:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                _buildRecipeList(),
                const SizedBox(height: 10),
                _buildAddIngredientButton(context),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveProduct,
                    child: const Text('Lưu Món'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeList() {
    return Column(
      children: _recipe.map((item) {
        return ListTile(
          title: Text(item.ingredientName),
          subtitle: Text('${item.amount} ${item.unit}'),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle, color: Colors.red),
            onPressed: () {
              setState(() {
                _recipe.remove(item);
              });
            },
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAddIngredientButton(BuildContext context) {
    // Dùng Builder để lấy context có InventoryBloc
    return Builder(
      builder: (context) {
        return ElevatedButton.icon(
          onPressed: () => _showSelectIngredientDialog(context),
          icon: const Icon(Icons.add),
          label: const Text('Thêm nguyên liệu'),
        );
      }
    );
  }

  void _showSelectIngredientDialog(BuildContext context) {
    // Lấy danh sách nguyên liệu từ InventoryBloc
    // Lưu ý: state có thể chưa load xong, nên check state
    // Ở đây giả sử load nhanh vì local DB
    showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: context.read<InventoryBloc>(), // Reuse bloc
          child: BlocBuilder<InventoryBloc, InventoryState>(
            builder: (context, state) {
              if (state is InventoryLoaded) {
                return AlertDialog(
                  title: const Text('Chọn nguyên liệu'),
                  content: SizedBox(
                    width: double.maxFinite,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.ingredients.length,
                      itemBuilder: (context, index) {
                        final ing = state.ingredients[index];
                        return ListTile(
                          title: Text(ing.name),
                          subtitle: Text('Đơn vị: ${ing.unit}'),
                          onTap: () {
                            Navigator.pop(dialogContext);
                            _showQuantityDialog(ing.id, ing.name, ing.unit);
                          },
                        );
                      },
                    ),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }

  void _showQuantityDialog(String id, String name, String unit) {
    final qtyController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Định lượng cho $name'),
        content: TextField(
          controller: qtyController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Số lượng ($unit)'),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              final qty = double.tryParse(qtyController.text) ?? 0;
              if (qty > 0) {
                setState(() {
                  _recipe.add(RecipeItem(
                    ingredientId: id,
                    ingredientName: name,
                    amount: qty,
                    unit: unit,
                  ));
                });
              }
              Navigator.pop(context);
            },
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      final product = Product(
        id: const Uuid().v4(),
        name: _nameController.text,
        price: double.tryParse(_priceController.text) ?? 0,
        category: _categoryController.text,
        description: _descController.text,
        recipe: _recipe,
      );

      // Thêm product (cần access ProductBloc từ context cha hoặc getIt)
      // Ở đây AddProductPage được push từ ProductListPage nên context cha có thể ko có ProductBloc nếu provider đặt sai chỗ.
      // Cách tốt nhất là dùng getIt để lấy bloc hoặc truyền bloc vào.
      // Để đơn giản, ta dùng getIt<ProductBloc>() và gọi add.
      // Tuy nhiên, ProductListPage đang dùng context.read, nghĩa là có Provider ở trên.
      
      // Cách fix an toàn: Truyền event về Bloc
      getIt<ProductBloc>().add(AddProduct(product));
      
      Navigator.pop(context);
    }
  }
}
