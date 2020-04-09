import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body:Container(
        child:RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/ProfilePage');
              },
              color: Colors.red[400],
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
      ),
    );
  }
}
