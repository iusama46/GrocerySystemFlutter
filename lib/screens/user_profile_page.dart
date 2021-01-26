import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfileDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Opacity(
                    opacity: 0.5,
                    child: ClipPath(
                      clipper: BottomWaveClipper(),
                      //set our custom wave clipper
                      child: Container(
                        color: Colors.grey,
                        height: 300,
                      ),
                    ),
                  ),
                  ClipPath(
                    //upper clippath with less height
                    clipper: BottomWaveClipper(), //set our custom wave clipper.
                    child: Container(
                      padding: EdgeInsets.only(bottom: 50),
                      color: Colors.black,
                      height: 280,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 120.0),
                    child: Column(
                      children: [
                        Image.asset("images/registration_bg.png"),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Event Management",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                            "User Details",
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
                            hintText: "Phone",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
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
                              hintText: "Phone",
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
                        TextFormField(
                          style: TextStyle(
                            fontSize: 20.0,
                            height: 2.0,
                          ),
                          decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
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
                                  "Clear",
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
                                  "Edit",
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
          ),
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
    Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
