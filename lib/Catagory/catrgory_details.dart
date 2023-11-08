import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/API/api_maneger.dart';
import 'package:news_app/Catagory/category.dart';
import 'package:news_app/Catagory/cubit/catagory_details_view_model.dart';
import 'package:news_app/repository/source/repository/source_repo_impl.dart';
import 'package:news_app/tab/tab_contaner.dart';
import 'package:news_app/Model/SourceResponce.dart';
import 'package:news_app/MyTheme.dart';

import 'cubit/staties.dart';

class CategoryDetails extends StatefulWidget {
  CategoryME category;
  CategoryDetails({
    required this.category,
  });
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel(injectSourceRepoContract());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourceByCategoryId(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, CategorySourceState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (state is SourceErrorState) {
          return Column(
            children: [
              Text('something went wrong'),
              ElevatedButton(onPressed: () {}, child: Text('Try Again'))
            ],
          );
        } else if(state is SourceSuccessState){
          return TabContainer(sourceList: state.sourceList!);
        }else{
          return Container();
        }
      },
    );

    // FutureBuilder<SourceResponse?>(
    //   future:ApiManager.getSource(widget.category.id),
    //   builder: (context,snapshot){
    //     if(snapshot.connectionState == ConnectionState.waiting)
    //       {
    //         return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,));
    //       }else if(snapshot.hasError)
    //         {
    //           return Column(
    //             children: [
    //               Text('something went wrong'),
    //               ElevatedButton(
    //                   onPressed: (){},
    //                   child: Text('Try Again'))
    //             ],
    //           );
    //         }
    //         if(snapshot.data?.status != 'ok')
    //           {
    //             return Column(
    //               children: [
    //                 Text(snapshot.data?.message ?? ''),
    //                 ElevatedButton(
    //                     onPressed: (){},
    //                     child: Text('Try Again'))
    //               ],
    //             );
    //           }
    //         var sourceList = snapshot.data?.sources ?? [];
    //         return TabContainer(sourceList: sourceList);
    //
    //   },
    // );
  }
}
