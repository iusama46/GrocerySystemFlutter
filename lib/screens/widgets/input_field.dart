import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}