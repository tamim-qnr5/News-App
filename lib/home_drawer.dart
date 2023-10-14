import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';

class HomeDrawer extends StatelessWidget {
  static const int category = 1;
  static const int setting = 2;
  Function onDrawerTap;
  HomeDrawer({required this.onDrawerTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Center(
              child: Text(
            'News App!',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: MyTheme.whiteColor),
          )),
          color: Theme.of(context).primaryColor,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        InkWell(
          onTap: () {
            onDrawerTap(HomeDrawer.category);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(CupertinoIcons.list_bullet),
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onDrawerTap(HomeDrawer.setting);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(CupertinoIcons.settings),
                Text(
                  'Setting',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
