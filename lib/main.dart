import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:prabhudemo1/pages/home_page.dart';
import 'package:prabhudemo1/pages/login_page.dart';
import 'package:prabhudemo1/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async{
  //WidgetsApp //MaterialApp //CupertinoApp

  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Constants.prefs.getBool("loggedIn") == true?HomePage():LoginPage(),
    theme: ThemeData(primarySwatch: Colors.purple),
    routes: {
      LoginPage.routeName:(context)=> LoginPage(),
      HomePage.routeName:(context)=> HomePage()
    },
  ),
  );
}


