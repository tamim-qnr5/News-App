import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Catagory/category.dart';
import 'package:news_app/MyTheme.dart';

class CategoryItem extends StatelessWidget {
  CategoryME category;
  int index;
  CategoryItem({required this.category,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.color,
          borderRadius:BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(index%2==0 ?24:0),
            bottomRight:Radius.circular(index%2==0 ?0:24),
          ) ),
      child: Column(
        children: [
          Image.asset(category.ImgUrl,height: MediaQuery.of(context).size.height*0.15,),
          Text(category.title,style: Theme.of(context).textTheme.titleLarge?.copyWith(color: MyTheme.whiteColor),),
        ],
      ),
    );
  }
}
