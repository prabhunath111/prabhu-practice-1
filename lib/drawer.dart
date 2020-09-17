import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          /*DrawerHeader(
               child: Text("Hi I am a drawer"),
               decoration: BoxDecoration(color: Colors.purple),
             ),*/
          UserAccountsDrawerHeader(
              accountName: Text("Prabhu"),
              accountEmail: Text("kjsk@hfkk.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1484515991647-c5760fcecfc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=687&q=80"),
              )),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("prabh@hjk.com"),
            subtitle: Text("Developer"),
            trailing: Icon(Icons.edit),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
