import 'package:booking_app/screens/home/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        actions: [
          FlatButton.icon(
            onPressed: ()async{
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Wrapper()));
            },
            icon: Icon(Icons.logout,color: Colors.white,),
            label: Text('Logout',style: TextStyle(color: Colors.white),),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Name',
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 1.0
                ),
              ),
              SizedBox(height: 10.0,),
              Text(
                'Peter George',
                style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 30.0,),
              Text(
                'Phone Number',
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 1.0
                ),
              ),
              SizedBox(height: 10.0,),
              Text(
                '01272075893',
                style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 30.0,),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'petergeoorge@gmail.com',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        letterSpacing: 1.0
                    ),
                  )
                ],
              ),
            ]
        ),
      ),
    );
  }
}
