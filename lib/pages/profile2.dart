import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:smart_parking/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_parking/setup/userdata.dart';
import 'package:smart_parking/setup/login.dart';

class Profile2 extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}


class _ProfileState extends State<Profile2> {

  String _email = 'mail';
  String _userid = 'username';
  User _userData;
  
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> _getUserEmail() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    setState(() {
      _email = user.email;
    });
    return this._email;
  }

Future<String> getCurrentUID() async {
  String userid = (await firebaseAuth.currentUser()).uid;
  setState(() {
    this._userid = userid;
  });
  this._userData = await FirestoreService().getUsername(this._userid);
  
  setState(() {
    });
}

  

  @override
  Widget build(BuildContext context) {
    _getUserEmail();
    getCurrentUID();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              displayUser(context, this._email,this._userData.username),
            ],
          ),
        ]

      ),
    );
 }

}
Widget displayUser(context, String email, String username){
  
  return Column(
    children: <Widget>[
      
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          username,
        ) ,
         ),



      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          email,
        ) ,
         ),

    ],
  );
}

