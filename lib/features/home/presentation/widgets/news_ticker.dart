import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marquee/marquee.dart';

import '../bloc/news_bloc.dart';

class NewsTicker extends StatelessWidget {
  const NewsTicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded && state.news.isNotEmpty) {
          final newsText = state.news.map((n) => n.title).join("   •   ");
          return Container(
            height: 40,
            color: Colors.orange.withOpacity(0.1),
            child: Marquee(
              text: newsText,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              blankSpace: 20.0,
              velocity: 50.0,
              pauseAfterRound: const Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration: const Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
