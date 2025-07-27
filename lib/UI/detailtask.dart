import 'package:fluterfestudy/models/taskList.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/newList.dart';

class DetailTaskScreen extends StatelessWidget{
  final TaskItem item;

  DetailTaskScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
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
          backgroundColor: Color(0xFFF54949),
        ),

        body:
        SingleChildScrollView(
            child:
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleNews(item.title),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      content(item.content)

                    ]
                )
            )
        )
    );
  }
}

Widget titleNews(String title){
  return Column(
      children: [
        SizedBox(
            height: 20
        ),
        Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines:5,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )
        ),
        SizedBox(
            height: 20
        ),
      ]
  );
}

Widget content(String content){
  return Column(
    children: [
      SizedBox(
          height: 20
      ),
      Text(
        content,
        overflow: TextOverflow.ellipsis,
        maxLines:50,
      ),
      Text(
        content,
        overflow: TextOverflow.ellipsis,
        maxLines:50,
      ),
      Text(
        content,
        overflow: TextOverflow.ellipsis,
        maxLines:50,
      ),
      Text(
        content,
        overflow: TextOverflow.ellipsis,
        maxLines:50,
      ),
      Text(
        content,
        overflow: TextOverflow.ellipsis,
        maxLines:50,
      ),
      Text(
        content,
        overflow: TextOverflow.ellipsis,
        maxLines:50,
      ),
      Text(
        content,
        overflow: TextOverflow.ellipsis,
        maxLines:50,
      ),
      SizedBox(
          height: 50
      ),
    ],
  );
}