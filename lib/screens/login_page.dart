import 'package:event_managemnet/screens/HomePage.dart';
import 'package:event_managemnet/screens/registration_page.dart';
import 'package:event_managemnet/screens/widgets/bottom_wave_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible;
  String email, password;

  //GlobalKey _formKey = GlobalKey<FormState>();
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
        print("Saved"+email);
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
                              top: MediaQuery.of(context).size.height * 0.03,
                              bottom:
                              MediaQuery.of(context).size.height * 0.018),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (val) {
                            email = val;
                          },
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'OpenSans'),
                          decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.black,
                            ),
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "required"),
                            EmailValidator(
                                errorText: 'enter a valid email address'),
                          ]),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextFormField(
                          onSaved: (val) {
                            password = val;
                          },
                          keyboardType: TextInputType.text,
                          obscureText: _passwordVisible,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                          ),
                          decoration: InputDecoration(
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
                          validator: RequiredValidator(errorText: "required"),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
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
                                  "Login",
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
                          height: MediaQuery.of(context).size.height * 0.02,
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
                                    builder: (context) => RegistrationPage()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "SignUp",
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
            top: MediaQuery.of(context).size.height * 0.065,
          ),
          child: Column(
            children: [
              Image.asset("images/login_bg.png"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: Text(
                  "Event Signature",
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
