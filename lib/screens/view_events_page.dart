import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewEventsPage extends StatefulWidget {
  @override
  _ViewEventsPageState createState() => _ViewEventsPageState();
}

class _ViewEventsPageState extends State<ViewEventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Icon(Icons.person),
        ],
        title: Text('Events'),
        leading: Image.asset(
          'images/menu_icon.png',
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text("Test"),
          ),ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text("Test"),
          ),ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text("Test"),
          ),ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text("Test"),
          ),ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text("Test"),
          ),ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text("Test"),
          ),ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text("Test"),
          ),ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text("Test"),
          ),
        ],
      )
    );
  }
}
