import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smart_parking/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_parking/setup/userdata.dart';
import 'package:smart_parking/setup/login.dart';

class Profile extends StatefulWidget {
  String _Email;

  Future<String> _getUserEmail() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    
      _Email = user.email;

    return _Email;
  }



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
            clipper: getClipper(),
          ),
          
          Positioned(
            width: 350.0, 
            top: MediaQuery.of(context).size.height/5,
            child: Column(
              children: <Widget>[
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image:DecorationImage(
                      image: NetworkImage(''),
                      fit: BoxFit.cover,
                      ),
                    borderRadius: BorderRadius.all(Radius.circular(75.0)),
                    boxShadow: [BoxShadow(blurRadius:7.0, color:Colors.black)]
                  ),
                ),
                SizedBox(height: 40.0,),
                Text(
                  'malavika',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10.0,),
                Text(
                 // _Email,
                 'qwds',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                SizedBox(height: 40.0),
                Container(
                  height: 40.0,
                  width: 95.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap:(){},
                        child: Center(
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0
                              ),
                          ),
                        ),
                    ),
                  ),
                ),


                SizedBox(height: 15.0),
                Container(
                  height: 40.0,
                  width: 95.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.redAccent,
                    color: Colors.red,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap:(){},
                        child: Center(
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              ),
                          ),
                        ),
                    ),
                  ),
                ),

                
                
              ],
            ),
          ),
        ],
      ),

      
    );
  }
}

class getClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = new Path();

    path.lineTo(0.0, size.height/2.2);
    path.lineTo(size.width+300,0.0);
    path.close();
    return path;
  }

  @override 
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return true;
  }
}

