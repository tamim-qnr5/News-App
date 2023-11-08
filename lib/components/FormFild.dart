import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/API/api_maneger.dart';

import '../MyTheme.dart';

class Custom_Form extends StatelessWidget {
  String controller;
  String Label;
  Function(String)? onChanged;
  Custom_Form(
      {required this.onChanged,
        required this.Label,
      required this.controller,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        onChanged:  onChanged,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 0,color: Colors.transparent)
            ),
            labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
            hintText: Label,
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)
        ),
      ),
    );
  }
}
