import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/post.dart';
import 'package:intl/intl.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: post.authorAvatar != null
                  ? CachedNetworkImageProvider(post.authorAvatar!)
                  : null,
              child: post.authorAvatar == null ? const Icon(Icons.person) : null,
            ),
            title: Text(post.authorName, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(
              DateFormat('dd/MM/yyyy HH:mm').format(post.createdAt),
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            trailing: IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(post.content, style: const TextStyle(fontSize: 15)),
          ),
          if (post.imageUrl != null && post.imageUrl!.isNotEmpty)
            Container(
              constraints: const BoxConstraints(maxHeight: 300),
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: post.imageUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(height: 200, color: Colors.grey[200]),
                errorWidget: (context, url, error) => const SizedBox.shrink(),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border, color: Colors.grey),
                  label: Text("${post.likes}", style: const TextStyle(color: Colors.grey)),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble_outline, color: Colors.grey),
                  label: Text("${post.comments}", style: const TextStyle(color: Colors.grey)),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share, color: Colors.grey),
                  label: const Text("Chia sẻ", style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
