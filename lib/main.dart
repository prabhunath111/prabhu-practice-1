import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:prabhudemo1/pages/home_page.dart';
import 'package:prabhudemo1/pages/login_page.dart';

void main() {
  //WidgetsApp //MaterialApp //CupertinoApp
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    theme: ThemeData(primarySwatch: Colors.purple),
    routes: {
      LoginPage.routeName:(context)=> LoginPage(),
      HomePage.routeName:(context)=> HomePage()
    },
  ),
  );
}


