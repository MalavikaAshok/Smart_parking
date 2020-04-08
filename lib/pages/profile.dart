import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            child:Container(
              color: Colors.black.withOpacity(0.8),
            ),
            //clipper: getClipper(),
          )
        ],
      ),

      
    );
  }
}

//class getClipper extends CustomClipper<Path>{

//}