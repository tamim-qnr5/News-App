import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/API/api_maneger.dart';
import 'package:news_app/Model/NewsResponse.dart';
import 'package:news_app/News/news_item.dart';

import '../Model/SourceResponce.dart';

class NewsContainer extends StatelessWidget {
Source source ;
NewsContainer({required this.source});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(source.id??''),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting)
        {
          return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,));
        }else if(snapshot.hasError)
        {
          return Column(
            children: [
              Text('something went wrong'),
              ElevatedButton(
                  onPressed: (){},
                  child: Text('Try Again'))
            ],
          );
        }
        if(snapshot.data?.status != 'ok')
        {
          return Column(
            children: [
              Text(snapshot.data?.message ?? ''),
              ElevatedButton(
                  onPressed: (){},
                  child: Text('Try Again'))
            ],
          );
        }
        var NewsList = snapshot.data?.articles??[];
        return ListView.builder(
            itemBuilder: (context,index){
              return NewsItem(news:NewsList[index]);
            },
        itemCount: NewsList.length,);
      },

    );
  }
}
