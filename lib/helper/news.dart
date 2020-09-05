import 'dart:convert';
import 'package:new_app/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/secret.dart';
class News {
  List<ArticalModal> news =[];
 Future<void> getNews() async{
   String url ="http://newsapi.org/v2/top-headlines?country=in&apiKey=dcfaf67f354a47fd80113c6fb33b25e8";
   var response = await http.get(url);
   var jsonData =jsonDecode(response.body);
   if(jsonData['status']== "ok"){
     jsonData["articles"].forEach((element){
       if(element['urlToImage']!=null && element['description']!= null){
         ArticalModal articalModal =ArticalModal(
           title: element['title'],
           author: element['author'],
           description: element['description'],
           url: element["url"],
           urlToImage: element['urlToImage'],

           content: element["content"],

         );
         news.add(articalModal);

       }

     });
   }
 }
}
class CategoryNewsClass {
  List<ArticalModal> news =[];
  Future<void> getNews(String category) async{
    String url ="http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=dcfaf67f354a47fd80113c6fb33b25e8";
    var response=await http.get(url);
    var jsonData =jsonDecode(response.body);
    if(jsonData['status']== "ok"){
      jsonData["articles"].forEach((element){
        if(element['urlToImage']!=null && element['description']!= null){
          ArticalModal articalModal =ArticalModal(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element["url"],
            urlToImage: element['urlToImage'],

            content: element["content"],
          );
          news.add(articalModal);
        }

      });
    }
  }
}