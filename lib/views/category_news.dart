import 'package:flutter/material.dart';
import 'package:new_app/helper/news.dart';


import 'package:new_app/helper/widget.dart';




class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});
  @override

  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var articles;
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Flutter'),
            Text(
              'News',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save),
            ),
          )
        ],
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          child:CircularProgressIndicator(),
        )
      ):SingleChildScrollView(

          child: Container(
            child: Container(



                  ///Blogs

                    margin: EdgeInsets.only(top: 16),
                    child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imageUrl: articles[index].urlToImage ?? "",
                            title: articles[index].title ?? "",
                            desc: articles[index].description ?? "",
                            url: articles[index].url ?? "",
                          );
                        }),



            ),
          ),
        ),
      );

  }

}
