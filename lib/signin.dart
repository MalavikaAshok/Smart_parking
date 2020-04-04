import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  String _email,_password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        ),
        body: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                validator:(input){
                  if(input.isEmpty){
                    return 'Please type the email';
                  }
                },
                onSaved: (input) => _email=input,
                decoration: InputDecoration(
                  labelText: 'email',
                ),
              ),
              TextFormField(
                validator:(input){
                  if(input.length<6){
                    return 'Password should be atleast 6 characters';
                  }
                },
                onSaved: (input) => _password=input,
                decoration: InputDecoration(
                  labelText: 'password',
                ),
                obscureText: true,
              ),
              RaisedButton(
                onPressed: (){},
                child: Text('Signin'),
              ),
          ],
        ),
       ),
    );
  }
  Future<void> signIn() async{
    final formState = _formkey.currentState;
    if(formState.validate()){
      formState.save();
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
     }
  }
}