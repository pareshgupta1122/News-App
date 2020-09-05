import 'package:flutter/material.dart';
import 'package:new_app/views/article_view.dart';

Widget MyAppBar(){
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Flutter",
          style:
          TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        Text(
          "News",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        )
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;


  BlogTile(
      {@required this.imageUrl, @required this.title, @required this.desc, @required this.url,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>
                ArticleView(
                  blogUrl: url,
                )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(imageUrl
                      , height: 200,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      fit: BoxFit.cover,)),
                SizedBox(height: 8,),
                Text(title,
                  maxLines: 2,

                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                SizedBox(height: 8,),
                Text(desc,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black54,
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}