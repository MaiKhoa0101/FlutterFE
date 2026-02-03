import 'package:flutter/material.dart';
import '../../../helper/dependency injections/locator.dart';
import '../../../helper/state management/bloc_news.dart';
import '../Widget/RowNewsSection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // 👇 QUAN TRỌNG: Thêm "..add(GetNewsEvent())"
      // Ý nghĩa: Vừa tạo Bloc xong là gửi lệnh "Lấy tin tức" ngay lập tức.
      create: (_) => NewsBloc(getNewsUseCase: sl())..add(GetNewsEvent()),

      child: Scaffold(
        // Dùng BlocBuilder để lắng nghe state thay đổi
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {

            // 1. Đang tải
            if (state is NewsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // 2. Tải thành công
            else if (state is NewsLoaded) {
              final news = state.news;
              // Nếu danh sách rỗng
              if (news.isEmpty) {
                return const Center(child: Text("Không có tin tức nào"));
              }

              return RefreshIndicator(
                onRefresh: () async {
                  // Gọi lại event khi kéo xuống để refresh
                  context.read<NewsBloc>().add(GetNewsEvent());
                },
                child: ListView.builder(
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    final item = news[index];
                    return RowNewsSection(context, item);
                  },
                ),
              );
            }

            // 3. Có lỗi
            else if (state is NewsError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Lỗi: ${state.message}'),
                    ElevatedButton(
                        onPressed: () {
                          // Thử lại khi lỗi
                          context.read<NewsBloc>().add(GetNewsEvent());
                        },
                        child: const Text("Thử lại")
                    )
                  ],
                ),
              );
            }

            // 4. Trạng thái ban đầu (Initial)
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}