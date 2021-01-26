import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class AddEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kToolBarColor,
        leading: Icon(Icons.arrow_back_ios),
        title: Text('Add Event'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Select Canvas',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
              Row(
                children: [
                  MyContainer(),
                  SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                  MyContainer(),
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                children: [
                  MyContainer(),
                  SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                  MyContainer(),
                ],
              ),
              SizedBox(height: 50.0,),
              /*Expanded(
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0
                  ),
                  children: [
                    Container(
                      //child: Image.asset('images/wall.png',),
                      decoration: myBoxDecoration(),
                    ),
                    Container(
                      //child: Image.asset('images/wall.png',),
                      decoration: myBoxDecoration(),
                    ),
                    Container(
                      //child: Image.asset('images/wall.png',),
                      decoration: myBoxDecoration(),
                    ),
                    Container(
                      //child: Image.asset('images/wall.png',),
                      decoration: myBoxDecoration(),
                    ),
                  ],
                ),
              ),*/
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 0.0),
                child: Text(
                  'Event Information',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: TextField(
                  style: TextStyle(),
                  decoration: InputDecoration(
                    hintText: "Start",
                    prefixIcon: Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: TextField(
                  style: TextStyle(),
                  decoration: InputDecoration(
                    hintText: "Start",
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: TextField(
                  style: TextStyle(),
                  decoration: InputDecoration(
                    hintText: "Start",
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 30.0,),
              SizedBox(
                height: 50.0,
                width: double.infinity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  color: Colors.black,
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Add Event",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //child: Image.asset('images/wall.png',),
      height: MediaQuery.of(context).size.height*0.16,
      width: MediaQuery.of(context).size.width*0.45,
      decoration: myBoxDecoration(),
    );
  }
}

class MyGridView extends StatelessWidget {
  const MyGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _listItem = [
      'images/item_one.png',
      'images/item_one.png',
      'images/item_one.png',
      'images/item_one.png',
    ];
    return Expanded(
      child: Container(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: const EdgeInsets.all(24.0),
          children: _listItem
              .map((item) => Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Container(
                      height: 10.0,
                      width: 10.0,
                      child: Image.asset(
                        'images/wall.png',
                        height: 100,
                        width: 400,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
        width: 8, //
        color: Colors.black //                <--- border width here
        ),
  );
}

class TextFields extends StatelessWidget {
  const TextFields({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          //margin: EdgeInsets.only(top: 120.0),
          child: Column(
            children: [
              //TODO
              //Image.asset("images/registration_bg.png"),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Add",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 20.0,
                      height: 2.0,
                    ),
                    decoration: InputDecoration(
                        hintText: "Date",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        )),
                    validator: (val) {
                      if (val.isEmpty)
                        return "Required";
                      else
                        return null;
                    },
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 20.0,
                      height: 2.0,
                    ),
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        )),
                    validator: (val) {
                      if (val.isEmpty)
                        return "Required";
                      else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      color: Colors.black,
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      color: Colors.white,
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
