import 'package:booking_app/models/user.dart';
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
  //sList<String> hallsNames=[];
  late Halls selectedHall;

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
                  hint:  Text("Select Hall"),
                  value: selectedHall,
                  onChanged: (Halls? Value) {
                    setState(() {
                      selectedHall = Value!;
                    });
                  },
                  items: widget.MyProperty.halls.map((Halls hall) {
                    return  DropdownMenuItem<Halls>(
                      value: hall,
                      child: Row(
                        children: <Widget>[
                          Text(
                            hall.hallName,
                            style:  TextStyle(color: Colors.black),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            hall.hallCapacity.toString(),
                          )
                        ],
                      ),
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
    );
  }
}
