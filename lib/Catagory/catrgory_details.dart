import 'package:flutter/material.dart';
import 'package:news_app/API/api_maneger.dart';
import 'package:news_app/Catagory/tab_contaner.dart';
import 'package:news_app/Model/SourceResponce.dart';
import 'package:news_app/MyTheme.dart';

class CategoryDetails extends StatelessWidget {
  static const String routeName = 'Category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {  },),
        centerTitle: true,
        title: Text('News App'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: FutureBuilder<SourceResponse?>(
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
        future: ApiManager.getSource(),
      ),
    );
  }
}
