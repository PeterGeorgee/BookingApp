import 'package:booking_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;

  //create user object based on Firebase User
  UID? _userFromFirebaseUser(User user){
    return user!=null?UID(uid: user.uid):null;
  }
  //auth change user stream
  Stream <UID?> get user{
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user!));
  }
  //signin with email and pass
  Future signInWithEmailAndPassword(String email,String password)async{
    try{
      UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      return _userFromFirebaseUser(user!);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email and pass
  Future registerWithEmailAndPassword(String email,String password)async{
    try{
      UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user=result.user;

      return _userFromFirebaseUser(user!);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

}