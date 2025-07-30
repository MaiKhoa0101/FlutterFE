
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

PreferredSizeWidget TopAppBar(
    BuildContext context, String title, Color color)
{
  return AppBar(
    title: Text(title),
    leading: IconButton(
        icon: Icon(Icons.ac_unit),
        onPressed: () {
          if (context.canPop()) {
            context.pop();
          } else {
            print("Không thể quay lại");
          }
        }
    ),
    backgroundColor: color,
  );
}