import 'package:flutter/material.dart';
import 'package:prabhudemo1/widgets/drawer.dart';
import "package:http/http.dart" as http;
import 'package:prabhudemo1/pages/login_page.dart';
import 'dart:convert';
import 'package:prabhudemo1/utils/constants.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  var myText = "Change my name.";
//  TextEditingController _nameController = TextEditingController();
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    print("res body ${res.body}");
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
          )
        ],
      ),
      body: data != null
          ? ListView.builder(
              itemBuilder: (
                context,
                index,
              ) {
                return ListTile(
                  title: Text(data[index]["title"]),
                  subtitle: Text("ID: ${data[index]["id"]}"),
                  leading: Image.network(data[index]["url"]),
                );
              },
              itemCount: data.length,
            )
          : Center(child: CircularProgressIndicator()),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
//        myText = _nameController.text;
//        setState(() {
//
//        });
          },
          child: Icon(Icons.send)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
