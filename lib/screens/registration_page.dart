import 'package:event_managemnet/model/registration_model.dart';
import 'package:event_managemnet/screens/HomePage.dart';
import 'package:event_managemnet/screens/login_page.dart';
import 'package:event_managemnet/screens/constants.dart';
import 'package:event_managemnet/screens/widgets/bottom_wave_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

User user = User();

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _passwordVisible;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = true;
  }

  void validate() {
    setState(() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        print("Saved" + user.email);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              MyAppBar(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 24.0, left: 24.0, bottom: 24.0),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.0001,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.018),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        _nameTextField(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        _phoneTextField(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        _emailTextField(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        _passwordTextField(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.063,
                          width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            color: Colors.black,
                            onPressed: () {
                              validate();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "SignUp",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.063,
                          width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w700,
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

  TextFormField _phoneTextField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (val) {
        user.phoneNo = val;
      },
      style: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
      decoration: InputDecoration(
        hintText: "+213 |",
        hintStyle: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
        prefixIcon: Icon(
          Icons.phone_android_outlined,
          color: Colors.black,
        ),
      ),
      /*CountryCodePicker(
            onChanged: print,
            initialSelection: 'IT',
            favorite: ['+39','FR'],

            showCountryOnly: false,
            showFlagMain: false,
            showOnlyCountryWhenClosed: true,
            alignLeft: false,
            showFlagDialog: true,
          ),*/

      validator: MultiValidator([
        RequiredValidator(errorText: "required"),
      ]),
    );
  }

  TextFormField _nameTextField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (val) {
        user.fullName = val;
      },
      style: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
      decoration: InputDecoration(
        hintText: "Full Name",
        hintStyle: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
        prefixIcon: Icon(
          Icons.person_outline_outlined,
          color: Colors.black,
        ),
      ),
      validator: MultiValidator([
        RequiredValidator(errorText: "required"),
      ]),
    );
  }

  TextFormField _emailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (val) {
        user.email = val;
      },
      style: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
        hintText: "Email",
        prefixIcon: Icon(
          Icons.email_outlined,
          color: Colors.black,
        ),
      ),
      validator: MultiValidator([
        RequiredValidator(errorText: "required"),
        EmailValidator(errorText: 'enter a valid email address'),
      ]),
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      onSaved: (val) {
        user.password = val;
      },
      keyboardType: TextInputType.text,
      obscureText: _passwordVisible,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'OpenSans',
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
        hintText: "Password",
        prefixIcon: Icon(
          Icons.https_outlined,
          color: Colors.black,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.black,
          ),
        ),
      ),
      validator: MultiValidator([
        RequiredValidator(errorText: "required"),
        MinLengthValidator(6, errorText: 'more than 6 characters required')
      ]),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: BottomWaveClipper(),
          child: Container(
            padding: EdgeInsets.only(bottom: 50),
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.28,
          ),
        ),
        ClipPath(
          clipper: BottomWaveClipper(),
          child: Container(
            color: Colors.black.withAlpha(75),
            //color: Colors.black.withOpacity(0.60),
            height: MediaQuery.of(context).size.height * 0.30,
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.07,
          ),
          child: Column(
            children: [
              Image.asset("images/registration_bg.png"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: Text(
                  kAppName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
