import 'package:flutter/material.dart';
import '../../dependency injections/locator.dart';
import '../../viewmodel/newsViewModel.dart';
import '../Widget/RowNewsSection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state management/bloc_news.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final newsViewModel = locator<NewsViewModel>();


  @override
  Widget build(BuildContext context) {
    final news = newsViewModel.news;

    return  BlocProvider(
      create: (_) => NewsBloc(locator.get())..add(GetNews()),
      child: Scaffold(
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NewsLoaded) {
              final news = state.news;
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<NewsBloc>().add(GetNews());
                },
                
                child: ListView.builder(
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    final item = news[index];
                    return RowNewsSection(context, item);
                  },
                ),
              );
            } else if (state is NewsError) {
              return Center(child: Text('Lỗi: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
