import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';

class CategoryME{
  String id;
  String title;
  String ImgUrl;
  Color color;
  
  CategoryME({required this.id,required this.title,required this.color,required this.ImgUrl});
  /*
  technology
  * */
  static List getCategory(){
    return [
      CategoryME(id: 'sports', title: 'Sports', color: MyTheme.redColor, ImgUrl: 'assets/ball.png'),
      CategoryME(id: 'general', title: 'General', color: MyTheme.darkBlueColor, ImgUrl: 'assets/Politics.png'),
      CategoryME(id: 'health', title: 'Health', color: MyTheme.pinkColor, ImgUrl: 'assets/health.png'),
      CategoryME(id: 'business', title: 'Business', color: MyTheme.orangeColor, ImgUrl: 'assets/bussines.png'),
      CategoryME(id: 'entertainment', title: 'Entertainment', color: MyTheme.lightBlueColor, ImgUrl: 'assets/ball.png'),
      CategoryME(id: 'science', title: 'Science', color: MyTheme.yellowColor, ImgUrl: 'assets/science.png'),
      CategoryME(id: 'technology', title: 'Technology', color: MyTheme.darkBlueColor, ImgUrl: 'assets/science.png'),
    ];
  }
}