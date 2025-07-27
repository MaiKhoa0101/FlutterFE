import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/newList.dart';

class DetailNewsScreen extends StatelessWidget{
  final NewsItem item;

  DetailNewsScreen({super.key, required this.item});

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
                  authorAndTime(item.author, item.publishedAt),
                  imageNews(item.urlToImage),
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

Widget authorAndTime(String author, String time){
  return Column(
      children: [
        Text(
            textAlign: TextAlign.left,
            author,
            style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
            )
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                author,
                style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey
                ),
              ),
              Text(
                time,
                style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey
                ),
              ),
            ]
        ),
        SizedBox(
            height: 20
        )
      ]
  );
}

Widget imageNews(String url){
  return Column(
      children: [
        Image(
          image: NetworkImage(url),
          fit: BoxFit.cover,
          height: 200,
          width: double.infinity,
        ),
        SizedBox(
            height: 20
        )
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