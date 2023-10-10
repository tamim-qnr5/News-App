import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';
import 'package:news_app/Home/home_screen.dart';
import 'package:news_app/Catagory/catrgory_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: CategoryDetails.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        CategoryDetails.routeName: (context) => CategoryDetails(),
      },
      debugShowCheckedModeBanner: false,
      theme: MyTheme.Theme,

    );
  }
}