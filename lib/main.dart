import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:prabhudemo1/pages/home_page.dart';

void main() {
  //WidgetsApp //MaterialApp //CupertinoApp
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(primarySwatch: Colors.purple),
  ));
}


