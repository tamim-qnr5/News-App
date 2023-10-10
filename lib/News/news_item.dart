import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/NewsResponse.dart';
import 'package:news_app/MyTheme.dart';

class NewsItem extends StatelessWidget {
  NewsItem({required this.news});
  News news;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,//to apply BorderRadius
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage??'',
                placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(news.author??'',style: Theme.of(context).textTheme.titleSmall?.copyWith(color: MyTheme.grayColor,fontSize:15),),
            
            Text(news.title??''),
            Text(news.publishedAt??'',
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: MyTheme.grayColor,fontSize:15 ),),
          ],
        ),
      ),
    );

  }
}

