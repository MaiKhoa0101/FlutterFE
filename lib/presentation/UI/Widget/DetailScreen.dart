import 'package:flutter/material.dart';

Widget titleInDetail(String title){
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

//Cố thể có nhiều ảnh nên dùng list để hiển thị
Widget imageNews(List<String> url){
  return Column(
      children: [
        for (var url in url)
          image(url)
      ]
  );
}

Widget image(String url){
  return  Column(
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