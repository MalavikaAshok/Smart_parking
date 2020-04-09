import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:smart_parking/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _usersCollectionReference = 
    Firestore.instance.collection('users');


Future createUser(User user) async{
  try{
    await _usersCollectionReference.document(user.userid).setData(user.toMap());

  }catch(e){
    if(e is PlatformException){
      return e.message;
    }
    return e.toString();
  }
}

Future<String> getCurrentUID() async{
  return (await firebaseAuth.currentUser()).uid;
}
}