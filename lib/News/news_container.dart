import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/API/api_maneger.dart';
import 'package:news_app/Model/NewsResponse.dart';
import 'package:news_app/News/news_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../Model/SourceResponce.dart';

class NewsContainer extends StatefulWidget {
Source source ;

NewsContainer({required this.source});
  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  final RefreshController refreshController = RefreshController(initialRefresh: true);
  ScrollController scrollController = ScrollController();
  late int page;
  @override
  void initState() {
    page = 1;
    super.initState();
    handelNext();

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNewsBySourceId(widget.source.id??'',page),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting)
        {
          return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,));
        }else if(snapshot.hasError)
        {
          return Center(
            child: Column(
              children: [
                Text('something went wrong'),
                ElevatedButton(
                    onPressed: (){
                      ApiManager.getNewsBySourceId(widget.source.id??'',page);
                      print(snapshot.error);
                    },
                    child: Text('Try Again'))
              ],
            ),
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
          controller: scrollController,
            itemBuilder: (context,index){
              return NewsItem(news:NewsList[index]);
            },
        itemCount: NewsList.length,);
      },

    );
  }
  void handelNext(){
    scrollController.addListener(()async
    {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent)
        {
          page++;
          ApiManager.getNewsBySourceId(widget.source.id??'', page);
          
        }
    });
  }
}
