import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../bloc/doctor_bloc.dart';
import '../bloc/news_bloc.dart';
import '../bloc/post_bloc.dart';
import '../bloc/specialty_bloc.dart';
import '../widgets/doctor_list.dart';
import '../widgets/news_ticker.dart';
import '../widgets/post_item.dart';
import '../widgets/service_grid.dart';
import '../widgets/specialty_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<DoctorBloc>()..add(const FetchDoctors())),
        BlocProvider(create: (_) => getIt<SpecialtyBloc>()..add(FetchSpecialties())),
        BlocProvider(create: (_) => getIt<NewsBloc>()..add(FetchNews())),
        BlocProvider(create: (_) => getIt<PostBloc>()..add(const FetchPosts())),
      ],
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<PostBloc>().add(const FetchPosts());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<DoctorBloc>().add(const FetchDoctors());
          context.read<SpecialtyBloc>().add(FetchSpecialties());
          context.read<NewsBloc>().add(FetchNews());
          context.read<PostBloc>().add(const FetchPosts(isRefresh: true));
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: _buildHeader(context),
            ),
            const SliverToBoxAdapter(
              child: NewsTicker(),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Dịch vụ toàn diện",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: ServiceGrid(),
            ),
             const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Chuyên khoa",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SpecialtyList(),
            ),
             const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Bác sĩ nổi bật",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: DoctorList(),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Bảng tin",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
              ),
            ),
            BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                if (state is PostLoaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                         if (index >= state.posts.length) {
                           return state.hasMore
                               ? const Center(child: CircularProgressIndicator())
                               : const SizedBox.shrink();
                         }
                        return PostItem(post: state.posts[index]);
                      },
                      childCount: state.posts.length + (state.hasMore ? 1 : 0),
                    ),
                  );
                } else if (state is PostError) {
                  return SliverToBoxAdapter(child: Center(child: Text(state.message)));
                } else if (state is PostLoading) {
                   return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
                }
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),
            const SliverToBoxAdapter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        String userName = "Người dùng";
        String? avatarUrl;
        if (state is AuthAuthenticated) {
          userName = state.user.name;
          // avatarUrl = state.user.avatarUrl;
        }

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.orange.withOpacity(0.2),
                Colors.grey[50]!,
              ],
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
          child: Column(
            children: [
              _buildWelcomeBanner(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Chào mừng quay lại, 👋", style: TextStyle(color: Colors.grey[700])),
                      Text(
                        userName,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: avatarUrl != null ? CachedNetworkImageProvider(avatarUrl) : null,
                    child: avatarUrl == null ? const Icon(Icons.person, color: Colors.orange) : null,
                  )
                ],
              ),
              const SizedBox(height: 16),
              _buildAISearchBar(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWelcomeBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.orange, Colors.orangeAccent],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.orange.withOpacity(0.6), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "Welcome to HelloDoc",
            style: TextStyle(color: Colors.white, letterSpacing: 2, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          const Text(
            "SỨC KHỎE LÀ VÀNG",
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 1, width: 30, color: Colors.white),
              const Text(" 2026 ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              Container(height: 1, width: 30, color: Colors.white),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAISearchBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.auto_awesome, color: Colors.orange, size: 30),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Bạn muốn hỏi gì hôm nay?",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onSubmitted: (value) {
                // context.push('/ai-chat', extra: value);
              },
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_upward, color: Colors.white, size: 20),
            ),
          )
        ],
      ),
    );
  }
}
