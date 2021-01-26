//TODO
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            Icon(Icons.person),
          ],
          title: Text('Notifications'),
          leading: Image.asset(
            'images/menu_icon.png',
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),

            ],
          ),
        ));
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          trailing: Text('Sign In'),
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset("images/icon_male_user.png"),
          ),
          title: Text("Test"),
          subtitle: Text('12:00 pm , 22 Oct ,2020'),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Divider(
            height: 2.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
