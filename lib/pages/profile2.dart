import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smart_parking/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_parking/setup/userdata.dart';
import 'package:smart_parking/setup/login.dart';

class Profile2 extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}


class _ProfileState extends State<Profile2> {

  String _Email;
  
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> _getUserEmail() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    setState(() {
      _Email = user.email;
    });
    return this._Email;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              displayUser(context, this._Email),
            ],
          ),
        ]

      ),
    );
      }


Widget displayUser(context, String email){
  
  return Column(
    children: <Widget>[
      


      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          email,
        ) ,
         ),

    ],
  );
}

}