import 'package:booking_app/models/user.dart';
import 'package:booking_app/screens/datapages/profile.dart';
import 'package:booking_app/screens/datapages/properties_list.dart';
import 'package:booking_app/screens/home/wrapper.dart';
import 'package:booking_app/services/properties_class.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PropertyData extends StatefulWidget {
  const PropertyData({Key? key,required this.MyProperty}) : super(key: key);
  final Properties MyProperty;

  @override
  _PropertyDataState createState() => _PropertyDataState();
}

class _PropertyDataState extends State<PropertyData> {



  List <String> imagelist=[
    'assets/egypt.png',
    'assets/egypt 1.jpg',
    'assets/egypt 2.jpg'
  ];
  String userType='Peter George ';
  //List<String> hallsNames=[];
  late Halls selectedHall;
  late section selectedSection;
  String _hintHall='Select Hall';
  String _hintSec='Select Section';
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    // for(int i=0;i<widget.MyProperty.halls.length;i++){
    //   hallsNames[i]=widget.MyProperty.halls[i].hallName;
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.MyProperty.propName),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.MyProperty.propName,style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                SizedBox(height: 5.0,),
                Text(widget.MyProperty.location,style: TextStyle(fontSize: 15.0),),
                SizedBox(height: 40.0,),
                DropdownButton<Halls>(
                  hint:  Text(_hintHall),
                  onChanged: (Halls? Value) {
                    setState(() {
                      _hintHall=Value!.hallName;
                      selectedHall = Value!;
                    });
                  },
                  items: widget.MyProperty.halls.map((Halls hall) {
                    return  DropdownMenuItem<Halls>(
                      value: hall,
                      child: Container(
                        height: 80,
                        width: 120,
                        child: ListTile(
                          leading: Text(hall.hallName),
                          title: Text(hall.hallCapacity.toString()),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 40.0,),
                DropdownButton<section>(
                  hint:  Text(_hintSec),
                  onChanged: (section? Value) {
                    setState(() {
                      _hintSec=Value!.sectionname;
                      selectedSection = Value!;
                    });
                  },
                  items: widget.MyProperty.secs.map((section sec) {
                    return  DropdownMenuItem<section>(
                      value: sec,
                      child: Text(sec.sectionname),
                    );
                  }).toList(),
                ),
                SizedBox(height: 40.0,),
                CarouselSlider.builder(itemCount: 3, itemBuilder: (context,index,realIndex){
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 1,vertical: 1),
                    color: Colors.grey[200],
                    child: Image.asset(imagelist[index],fit: BoxFit.cover,),
                  );
                }, options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                )
                ),
                SizedBox(height: 50.0,),
                FloatingActionButton.extended(
                  backgroundColor: Colors.black,
                  onPressed: () {  },
                  label: Text('Reserve Now!'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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
          BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              title: Text('Logout'),
              backgroundColor: Colors.black
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
          if(index==0){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Wrapper()),);
          }
          else if(index==1){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()),);
          }
          else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Wrapper()),);
          }
        },
      ),
    );
  }
}
