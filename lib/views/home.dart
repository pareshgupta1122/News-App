import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_app/helper/data.dart';
import 'package:new_app/helper/news.dart';

import 'package:new_app/models/category_model.dart';


import 'package:new_app/helper/widget.dart';

import 'category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  var articles;
  bool _loading;
  List<CategoryModel> categories = new List<CategoryModel>();
  getNews() async{
    News news =  News();
    await news.getNews();
    articles =news.news;
    setState(() {
      _loading=false;
    });
  }
  @override
  void initState() {
    _loading=true;
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(





      appBar: MyAppBar(),


            body: SafeArea(
              child: _loading ? Center(


                child: Container(

                  padding: EdgeInsets.symmetric(horizontal: 16),
                 child: CircularProgressIndicator(),
                ),
              ): SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      /// Categories
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 70.0,
                        child: ListView.builder(
                            itemCount: categories.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                imageUrl: categories[index].imageUrl,
                                categoryName: categories[index].categoryName,
                              );
                            }),
                      ),
                      ///Blogs
                      Container(
                        padding: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                          itemCount: articles.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index){
                            return BlogTile(
                              imageUrl: articles[index].urlToImage ?? "",
                              title: articles[index].title ?? "",
                              desc: articles[index].description ?? "",
                              url: articles[index].url ?? "",
                            );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );




  }
}

class CategoryTile extends StatelessWidget {
  final  String imageUrl, categoryName;

  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryNews(
                  category: categoryName.toLowerCase(),

                )
        )
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(06),
              child: CachedNetworkImage(
                imageUrl:
                imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(06),
               color: Colors.black26,
             ),

              child: Text(categoryName,style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),),
            )
          ],
        ),
      ),
    );
  }
}

