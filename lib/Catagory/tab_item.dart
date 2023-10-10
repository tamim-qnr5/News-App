import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';

import '../Model/SourceResponce.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;
  TabItem({required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      child: Text(
        source.name ?? '',
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: isSelected
                ? MyTheme.whiteColor
                : Theme.of(context).primaryColor),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Theme.of(context).primaryColor, width: 3),
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
      ),
    );
  }
}
