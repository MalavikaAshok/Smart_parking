import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_parking/models/user.dart';
import 'package:smart_parking/setup/userdata.dart';
import 'package:smart_parking/setup/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Register> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    bool _isLoading = false;
    static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    String _username,_email,_password,_vehicleno;
    double _mobile;
   // TextEditingController _textFieldController = TextEditingController();
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 600.0,
                    width: 350.0,
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
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                               'Sign Up',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 28, bottom: 20),
                          child: TextFormField(
                          autocorrect: false,
                          autofocus: false,
                          style: TextStyle(
                            fontSize:20.0,
                          ),
                          decoration: InputDecoration(
                            hintText: 'username',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.all(15.0)
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please fill the username';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _username = value;
                          },
                        ),
                      ),

                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                          autocorrect: false,
                          autofocus: false,
                          style: TextStyle(
                            fontSize:20.0,
                          ),
                          decoration: InputDecoration(
                            hintText: 'email',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.all(15.0)
                          ),
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
                          margin: EdgeInsets.only(top:10),
                          child: TextFormField(
                          autocorrect: false,
                          autofocus: false,
                          style: TextStyle(
                            fontSize:20.0,
                          ),
                          decoration: InputDecoration(
                            hintText: 'password',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.all(15.0)
                          ),
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
                          
                          margin: EdgeInsets.only(top:20),
                          child: TextFormField(
                         // controller: _textFieldController,
                          //rkeyboardType: TextInputType.number,
                          autocorrect: false,
                          autofocus: false,
                          style: TextStyle(
                            fontSize:20.0,
                          ),
                          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(
                            hintText: 'mobile number',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.all(15.0)
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter the mobile';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _mobile = double.parse(value);
                          },
                        ),
                      ),

                       Container(
                          margin: EdgeInsets.only(top:20,bottom: 10),
                          child: TextFormField(
                          autocorrect: false,
                          autofocus: false,
                          style: TextStyle(
                            fontSize:20.0,
                          ),
                          decoration: InputDecoration(
                            hintText: 'vehicle no',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.all(15.0)
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter the vehicle number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _vehicleno = value;
                          },
                        ),
                      ),
                      
                      Container(
                      width: 350,
                      margin: EdgeInsets.only(top: 10),
                      child: RaisedButton(
                        onPressed: (){
                          _validateAndSubmit();
                        },
                        },
                        color: Colors.red[400],
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            ),
                        ),
                      ),
                      ),

                      Container(
                      
                      margin: EdgeInsets.only(top:10),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Text(
                        'Already Registered?',
                      ),
                      FlatButton(
                        child: Text(
                          'LOG IN',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {},
                        textColor: Colors.blue,
                      )
                    ],
                  ),
                 ),



                    ],
                  ),
                )
              ],

            ),
          ],
          
        ),
      ),
      

    );
  }

bool _validateAndSave() {
    final FormState form = _formkey.currentState;
    if (form.validate()) {
      form.save();
      // print('firstname: $_firstName, lastname: $_lastName, gender: $_gender, email: $_email,dob: $_dob,password: $_password');
      return true;
    }
    return false;
  }






void _validateAndSubmit() async {
    if (_validateAndSave()) {
      setState(() {
        _isLoading = true;
      });
      try {
        FirebaseUser user = (await firebaseAuth.createUserWithEmailAndPassword(
        email: _email, password: _password)).user;
        print(user.uid);
        _saveUserToDatabases();
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        print('error: $error');
        setState(() {
          _isLoading = false;
        });
      }
    }
  }


void _saveUserToDatabases() async {
  FirebaseUser signeduser = await firebaseAuth.currentUser();
    
    User user = User(
      userid: signeduser.uid,
      username: _username,
      email: _email,
      password: _password,
      mobile: _mobile,
      vehicle: _vehicleno,


      
      );
        

     await FirestoreService().createUser(user);
    //debugPrint('created user to firestore');
    //DocumentSnapshot userDoc = await userRef.get();

    Navigator.of(context)
        .pushNamedAndRemoveUntil('/loginPage', (Route<dynamic> route) => false);
  }
  
}