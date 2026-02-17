import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'features/inventory/data/models/ingredient_model.dart';
import 'features/inventory/presentation/bloc/inventory_bloc.dart';
import 'features/product/data/models/product_model.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/sales/data/models/order_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();
  Hive.registerAdapter(IngredientModel.adapter);
  Hive.registerAdapter(ProductModel.adapter);
  Hive.registerAdapter(RecipeItemModel.adapter);
  Hive.registerAdapter(OrderModel.adapter);
  Hive.registerAdapter(OrderItemModel.adapter);
  
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Dùng getIt<T>() trực tiếp trong create
        // Lưu ý: ProductBloc đã override close() để không bị dispose nhầm
        BlocProvider(create: (context) => getIt<InventoryBloc>()..add(LoadIngredients())),
        BlocProvider(create: (context) => getIt<ProductBloc>()..add(LoadProducts())),
      ],
      child: MaterialApp.router(
        title: 'Sweet Coffee Manager',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellow,
            primary: const Color(0xFFE91E63),
            secondary: const Color(0xFFFFC107),
            tertiary: const Color(0xFFF48FB1),
            surface: Colors.white,
            background: const Color(0xFFFFFDF5),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFE91E63),
            foregroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE91E63),
              foregroundColor: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xFFFFC107),
            foregroundColor: Colors.black87,
          ),
          cardTheme: CardThemeData(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            shadowColor: Colors.yellow.withOpacity(0.2),
          ),
          iconTheme: const IconThemeData(color: Color(0xFFE91E63)),
          useMaterial3: true,
        ),
        routerConfig: appRouter,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('vi'),
        ],
      ),
    );
  }
}
