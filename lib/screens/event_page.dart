import 'package:event_managemnet/screens/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kToolBarColor,
        leading: Icon(Icons.arrow_back_ios_sharp),
        title: Text('Event'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(30.0),
                decoration: myBoxDecoration(),
                child: Container(
                  decoration: myBoxDecoration2(),
                  child: Image.asset(
                    "images/del.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Divider(
                height: 2.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Icon(Icons.group),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Text("Attendance",style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "85",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.1,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "people attend the meetings",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration myBoxDecoration2() {
  return BoxDecoration(
    border: Border.all(
        width: 12, //
        color: Colors.blue[100] //                <--- border width here
        ),
  );
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
        width: 12, //
        color: Colors.black //                <--- border width here
        ),
  );
}

BoxDecoration myBoxDecoration1() {
  return BoxDecoration(
    border: Border(
      left: BorderSide(
        //                   <--- left side
        color: Colors.black,
        width: 18.0,
      ),
      top: BorderSide(
        //                    <--- top side
        color: Colors.black,
        width: 18.0,
      ),
    ),
  );
}
