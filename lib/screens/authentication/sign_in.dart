import 'package:booking_app/screens/shared/loading.dart';
import 'package:booking_app/screens/shared/constants.dart';
import 'package:booking_app/services/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth=AuthService();
  final _formkey=GlobalKey<FormState>();
  bool loading=false;

  String email='';
  String password='';
  String error='';

  @override
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text('Sign in to BookingApp'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val)=>val!.isEmpty?'Enter an email':null,
                onChanged: (val){
                  setState(() {
                    email=val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration:textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val)=>val!.length<6?'Enter a password 6+ chars long':null,
                onChanged: (val){
                  setState(() {
                    password=val;
                  });
                },
              ),
              SizedBox(height: 10.0,),
              RaisedButton(
                onPressed: () async {
                  if(_formkey.currentState!.validate()){
                    setState(() {
                      loading=true;
                    });
                    dynamic result=await _auth.signInWithEmailAndPassword(email, password);
                    if(result==null){
                      setState(() {
                        error='Could not sign in with the given credentials';
                        loading=false;
                      });
                    }
                  }
                  Navigator.pushNamed(context, '/propsList');
                },
                color: Colors.black,
                child: Text('Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20.0,),
              RichText(
                text: TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(fontSize: 15.0,color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Click Here',
                      recognizer: TapGestureRecognizer()
                        ..onTap=(){
                          widget.toggleView();
                        },
                      style: TextStyle(color: Colors.blue)
                    )
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
