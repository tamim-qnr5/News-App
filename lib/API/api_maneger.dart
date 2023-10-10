import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/API/api_constants.dart';
import 'package:news_app/Catagory/category.dart';
import 'package:news_app/Model/NewsResponse.dart';
import 'package:news_app/Model/SourceResponce.dart';
//https://newsapi.org/v2/top-headlines/sources?apiKey=546e2bedf1f242eeba68117d49a5ea9c
class ApiManager{


  static Future<SourceResponse> getSource(String categoryId)async
  {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.soureceApi,
      {
        'apiKey' : '546e2bedf1f242eeba68117d49a5ea9c',
        'category' : categoryId ,
      }
    );
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    }catch(e){
      throw e;
    }

  }
  static Future<NewsResponse> getNewsBySourceId(String sourceId)async{
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=546e2bedf1f242eeba68117d49a5ea9c
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.NewsApi,
        {
          'apiKey' : '546e2bedf1f242eeba68117d49a5ea9c',
          'sources' : sourceId,
          
    });
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e;
    }
  }
}