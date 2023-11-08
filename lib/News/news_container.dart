import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/News/cubit/news_staties.dart';
import 'package:news_app/News/news_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../Model/SourceResponce.dart';
import '../repository/news/repository/news_repo_impl.dart';
import 'cubit/news_container_view_model.dart';

class NewsContainer extends StatefulWidget {
  Source source;

  NewsContainer({required this.source});
  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsContainerViewModel viewModel = NewsContainerViewModel(injectNewsRepoContract());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsByCategoryId(widget.source.id??'');
  }
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsContainerViewModel, NewsSourceState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ));
        } else if (state is NewsErrorState) {
          return Center(
            child: Column(
              children: [
                const Text('something went wrong'),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getNewsByCategoryId(widget.source.id??'');
                    },
                    child: const Text('Try Again'))
              ],
            ),
          );
        } else if (state is NewsSuccessState) {
          return ListView.builder(
            controller: scrollController,
            itemBuilder: (context, index) {
              return NewsItem(news: state.newsList![index]);
            },
            itemCount: state.newsList!.length,
          );
        } else {
          return Container();
        }
      },
    );
    //   FutureBuilder<NewsResponse>(
    //   future: ApiManager.getNewsBySourceId(widget.source.id??''),
    //   builder: (context,snapshot){
    //     if(snapshot.connectionState == ConnectionState.waiting)
    //     {
    //       return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,));
    //     }else if(snapshot.hasError)
    //     {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text('something went wrong'),
    //             ElevatedButton(
    //                 onPressed: (){
    //                   ApiManager.getNewsBySourceId(widget.source.id??'');
    //                   print(snapshot.error);
    //                 },
    //                 child: Text('Try Again'))
    //           ],
    //         ),
    //       );
    //     }
    //     if(snapshot.data?.status != 'ok')
    //     {
    //       return Column(
    //         children: [
    //           Text(snapshot.data?.message ?? ''),
    //           ElevatedButton(
    //               onPressed: (){},
    //               child: Text('Try Again'))
    //         ],
    //       );
    //     }
    //     var NewsList = snapshot.data?.articles??[];
    //     return ListView.builder(
    //       controller: scrollController,
    //         itemBuilder: (context,index){
    //           return NewsItem(news:NewsList[index]);
    //         },
    //     itemCount: NewsList.length,);
    //   },
    //
    // );
  }
}
