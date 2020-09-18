import 'package:flutter/material.dart';
import 'package:prabhudemo1/widgets/drawer.dart';
import "package:http/http.dart" as http;
import 'package:prabhudemo1/pages/login_page.dart';
import 'dart:convert';
import 'package:prabhudemo1/utils/constants.dart';

class HomePageSB extends StatefulWidget {
  static const String routeName = "/home";

  @override
  _HomePageSBState createState() => _HomePageSBState();
}

class _HomePageSBState extends State<HomePageSB> {
//  var myText = "Change my name.";
//  TextEditingController _nameController = TextEditingController();
  final url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    return data;
//    print("res body ${res.body}");
//    setState(() {});
  }

  Stream<List<String>> getStream(){
    var data = Stream<List<String>>.fromIterable([
      List<String>.generate(20, (index) => "Item $index")
    ]);

    return data;
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
      body: StreamBuilder(
        stream: getStream(),
//        future: fetchData(),
        // ignore: missing_return
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return Center(child: Text("Fetch Something"),);
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if(snapshot.hasError){
                return Center(
                  child: Text(
                      "Some Error Occured"
                  ),
                );
              }
              return ListView.builder(
                itemBuilder: (
                    context,
                    index,
                    ) {
                  return ListTile(
                    title: Text(snapshot.data[index]),
                  );
                },
//                itemCount: data.length,
              );
          }
        },
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
//        myText = _nameController.text;
//        setState(() {});
          },
          child: Icon(Icons.send)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
