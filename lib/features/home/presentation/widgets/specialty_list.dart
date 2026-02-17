import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/specialty_bloc.dart';

class SpecialtyList extends StatelessWidget {
  const SpecialtyList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialtyBloc, SpecialtyState>(
      builder: (context, state) {
        if (state is SpecialtyLoaded) {
          return SizedBox(
            height: 120,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: state.specialties.length,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final specialty = state.specialties[index];
                return Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: specialty.image != null
                          ? CachedNetworkImage(
                              imageUrl: specialty.image!,
                              placeholder: (context, url) => const Icon(Icons.local_hospital, color: Colors.orange),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            )
                          : const Icon(Icons.local_hospital, color: Colors.orange, size: 40),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      specialty.name,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                );
              },
            ),
          );
        } else if (state is SpecialtyLoading) {
           return const SizedBox(height: 120, child: Center(child: CircularProgressIndicator()));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
