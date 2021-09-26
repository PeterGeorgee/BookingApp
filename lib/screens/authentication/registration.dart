import 'package:booking_app/screens/shared/constants.dart';
import 'package:booking_app/screens/shared/loading.dart';
import 'package:booking_app/services/auth.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  final Function toggleView;
  Registration({required this.toggleView});

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final AuthService _auth=AuthService();
  final _formkey=GlobalKey<FormState>();
  bool loading=false;

  String username='';
  String email='';
  String password='';
  String firstName='';
  String lastName='';
  DateTime dateofbirth=DateTime.now();
  String userType='Normal User ';
  String error='';

  @override
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text('Register in BookingApp'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration:textInputDecoration.copyWith(hintText: 'First name'),
                  validator: (val)=>val!.isEmpty?'Enter your first name':null,
                  onChanged: (val){
                    setState(() {
                      firstName=val;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration:textInputDecoration.copyWith(hintText: 'Last name'),
                  validator: (val)=>val!.isEmpty?'Enter your last name':null,
                  onChanged: (val){
                    setState(() {
                      lastName=val;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Username'),
                  validator: (val)=>val!.isEmpty?'Enter a unique username':null,
                  onChanged: (val){
                    setState(() {
                      username=val;
                    });
                  },
                ),
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
                SizedBox(height: 20.0,),
                FlatButton.icon(
                  icon: Icon(Icons.calendar_today),
                  label: Text('Date of birth'),
                  onPressed: ()async{
                    final DateTime? pickedDate=await showDatePicker(context: context, initialDate: dateofbirth, firstDate: DateTime(1940), lastDate: DateTime(2030));
                    setState(() {
                      dateofbirth=pickedDate!;
                    });
                  },
                ),
                SizedBox(height: 10.0,),
                DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down_circle),
                  iconSize: 20,
                  elevation: 25,
                  value: userType,
                  items: <String>['Property Owner ', 'Normal User ']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      userType = newValue!;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  onPressed: () async {
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        loading=true;
                      });
                      dynamic result=await _auth.registerWithEmailAndPassword(email, password);
                      if(result==null){
                        setState(() {
                          error='Please enter a valid email address';
                          loading=false;
                        });
                      }
                    }
                  },
                  color: Colors.black,
                  child: Text('Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
