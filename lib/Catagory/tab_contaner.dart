import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:news_app/Catagory/tab_item.dart';

import '../Model/SourceResponce.dart';
import '../News/news_container.dart';

class TabContainer extends StatefulWidget {

List<Source> sourceList;

TabContainer({required this.sourceList});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
var selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
    child: Column(
      children: [
        TabBar(
          onTap: (index){
            selectedTab = index;
            setState(() {

            });
          },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs: widget.sourceList.map((source) => TabItem
              (
                isSelected: widget.sourceList.indexOf(source) == selectedTab,
                source: source
            )).toList()
        ),
        Expanded(child: NewsContainer(source: widget.sourceList[selectedTab]))
      ],
    ),);
  }
}
