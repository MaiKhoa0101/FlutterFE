import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/newList.dart';

Widget RowNewsSection(BuildContext context, NewsItem item) {
  return InkWell(
    onTap: () {
      context.push('/detailNews', extra: item);
    },
    child: Column(
      children: [
        const Divider(color: Colors.grey, thickness: 1, height: 0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(item.title,
                    maxLines: 5, overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(width: 15),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                onSelected: (value) {
                  if (value == 'edit') {
                    print('Chỉnh sửa');
                  } else if (value == 'delete') {
                    print('Xoá');
                  }
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: 'edit',
                    child: Text('Chỉnh sửa'),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text('Xoá'),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 1, height: 0),
      ],
    ),
  );
}
