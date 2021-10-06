import 'package:booking_app/screens/datapages/profile.dart';
import 'package:booking_app/screens/datapages/properties_list.dart';
import 'package:booking_app/screens/home/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage=0;
  final pages=[
    PropertiesList(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              backgroundColor: Colors.black
          ),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.logout),
          //     title: Text('Logout'),
          //     backgroundColor: Colors.black
          // ),
        ],
        onTap: (index) async {
          setState(() {
            _selectedPage=index;
          });
          if(_selectedPage==2) {
            await FirebaseAuth.instance.signOut();
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Wrapper()));
          }
        },
      ),
    );
  }
}
