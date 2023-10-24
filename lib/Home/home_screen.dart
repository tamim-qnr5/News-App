import 'package:flutter/material.dart';
import 'package:news_app/Catagory/category.dart';
import 'package:news_app/Catagory/catrgory_details.dart';
import 'package:news_app/MyTheme.dart';

import '../API/api_maneger.dart';
import '../Catagory/category_fragments.dart';
import '../Settings.dart';
import '../components/FormFild.dart';
import '../home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchController = '';
  bool search = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: MyTheme.whiteColor,
        child: Image.asset(
          'assets/pattern.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: (search)
            ? AppBar(
                leadingWidth: 0,
                title: (Container(
                  decoration: BoxDecoration(
                      color: MyTheme.whiteColor,
                      borderRadius: const BorderRadius.all(Radius.circular(90))),
                  width: double.infinity,
                  child: Custom_Form(
                    onChanged: (value) {
                      searchController = value;
                      print(value);
                      // ApiManager.getNewsBySourceId(
                      //   selectedCategory?.id ?? '',
                      // );
                    },
                    Label: 'search',
                    controller: searchController,
                  ),
                )),
                leading: Container(),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: (selectedCategory == null)
                        ? Container()
                        : IconButton(
                            onPressed: () {
                              search = false;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.search,
                            )),
                  )
                ],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
              )
            : AppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: (selectedCategory == null)
                        ? Container()
                        : IconButton(
                            onPressed: () {
                              search = true;
                              setState(() {});
                            },
                            icon: Icon(Icons.search)),
                  )
                ],
                centerTitle: true,
                title: Text(selectedCategory == null
                    ? 'News App'
                    : selectedCategory?.title ?? ''),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
              ),
        drawer: Drawer(
          child: HomeDrawer(
            onDrawerTap: onDrawerTap,
          ),
        ),
        body: selectedDrawer == HomeDrawer.setting
            ? settings()
            : selectedCategory == null
                ? CategoryFragment(onCategoryTap: onCategoryTap)
                : CategoryDetails(
                    category: selectedCategory!,
                  ),
      ),
    ]);
  }

  CategoryME? selectedCategory;

  void onCategoryTap(CategoryME newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedDrawer = HomeDrawer.category;
  void onDrawerTap(int newSelectedDrawer) {
    selectedDrawer = newSelectedDrawer;
    selectedCategory = null;
    setState(() {});
    Navigator.pop(context);
  }
}
