import 'package:flutter/material.dart';
import 'package:news_app/API/api_maneger.dart';
import 'package:news_app/Catagory/category.dart';
import 'package:news_app/tab/tab_contaner.dart';
import 'package:news_app/Model/SourceResponce.dart';
import 'package:news_app/MyTheme.dart';

class CategoryDetails extends StatefulWidget {
  
  CategoryME category;
  CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future:ApiManager.getSource(widget.category.id),
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
              var sourceList = snapshot.data?.sources ?? [];
              return TabContainer(sourceList: sourceList);

        },
      );
  }
}
