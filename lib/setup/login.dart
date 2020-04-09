import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:smart_parking/pages/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formkey,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'assets/images/car3.jpg',
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/traffic.png',
                    height: 100.0, width: 100.0),
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Container(
                    height: 300.0,
                    width: 320.0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            autocorrect: false,
                            autofocus: false,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                            decoration: InputDecoration(
                                hintText: 'email',
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: EdgeInsets.all(15.0)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please fill the email';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _email = value;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            autocorrect: false,
                            autofocus: false,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                            decoration: InputDecoration(
                                hintText: 'password',
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: EdgeInsets.all(15.0)),
                            validator: (value) {
                              if (value.length < 6) {
                                return 'password must be alieast 6 characters';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _password = value;
                            },
                          ),
                        ),
                        Container(
                          width: 350,
                          margin: EdgeInsets.only(top: 10),
                          child: RaisedButton(
                            onPressed: logIn,
                            color: Colors.red[400],
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Create a new Account?',
                              ),
                              FlatButton(
                                child: Text(
                                  'Register',
                                  style: TextStyle(fontSize: 15),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed('/registerPage');
                                },
                                textColor: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logIn() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        Navigator.of(context).pushNamed('/homePage');
      } catch (e) {
        print(e.message);
      }
    }
  }
}
