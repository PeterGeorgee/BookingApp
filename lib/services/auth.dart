import 'package:booking_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/services/SavingUserData.dart';

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
  Future registerWithEmailAndPassword(String email,String password,String firstname,String Lastname, String UserName, bool isnormaluser, String phonenumber)async{
    try{
      UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      await saveuserdata(userid: user!.uid).UpdateUserData(firstname, Lastname, UserName, isnormaluser, phonenumber);

      return _userFromFirebaseUser(user!);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

}