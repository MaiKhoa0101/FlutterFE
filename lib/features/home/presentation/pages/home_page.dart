import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import '../../../../core/di/injection.dart'; // Import getIt

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _apiStatus = "Chưa gọi API";

  Future<void> _testApi() async {
    try {
      final dio = getIt<Dio>(); // Lấy Dio từ GetIt đã config
      // Gọi thử API placeholder để test kết nối
      final response = await dio.get('https://jsonplaceholder.typicode.com/todos/1'); 
      setState(() {
        _apiStatus = "API OK: ${response.statusCode}\nData: ${response.data['title']}";
      });
    } catch (e) {
      setState(() {
        _apiStatus = "Lỗi API: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HelloDoc - Clean Start"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 20),
            const Text(
              "Dự án đã được làm sạch!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Cấu hình hiện tại: Dio, Hive, GoRouter, GetIt"),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _testApi,
              child: const Text("Test Kết nối API (Dio)"),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Text(_apiStatus, textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
