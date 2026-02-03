import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../dataclass/newList.dart';

Widget RowNewsSection(BuildContext context, NewsItem item) {
  return InkWell(
    onTap: () {
      context.push('/detailNews', extra: item);
    },
    child: Column(
      children: [
        const Divider(color: Colors.grey, thickness: 1, height: 0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(item.title,
                    maxLines: 5, overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(width: 15),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 1, height: 0),
      ],
    ),
  );
}
