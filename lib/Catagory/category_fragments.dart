import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Catagory/category.dart';

import 'category_item.dart';

class CategoryFragment extends StatelessWidget {
 var catList = CategoryME.getCategory();
 Function onCategoryTap;
 CategoryFragment({required this.onCategoryTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pick your category\nof interest',style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing:18
                ),
              itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){onCategoryTap(catList[index]);},
                      child: CategoryItem(index: index,category: catList[index],));
              },
              itemCount: catList.length,

            ),
          )
        ],
      ),
    );
  }
}
