import 'package:flutter/material.dart';

class MyTheme {
  static Color primeColor = Color(0xff39a552);
  static Color redColor = Color(0xffc71c22);
  static Color darkBlueColor = Color(0xff003e8f);
  static Color pinkColor = Color(0xffeb1e78);
  static Color orangeColor = Color(0xffcd7d47);
  static Color lightBlueColor = Color(0xff4781cd);
  static Color yellowColor = Color(0xfff0d151);
  static Color blackColor = Color(0xff000000);
  static Color whiteColor = Color(0xfffafafa);
  static Color grayColor = Color(0xffc8c9cb);
  static ThemeData Theme = ThemeData(
    primaryColor: primeColor,
    textTheme: TextTheme(
        titleLarge: TextStyle(
            color: blackColor,
            fontSize: 22,
            fontWeight: FontWeight.bold
        ),
        titleMedium: TextStyle(
            color: blackColor,
            fontSize: 20,
            fontWeight: FontWeight.w700
        ),
        titleSmall: TextStyle(
            color: blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w400
        )
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: primeColor
    )

  );
}