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

  @override
  Widget build(BuildContext context) {
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
                DropdownButtonFormField<String>(
                  hint: Text('Choose Type'),
                  value: userType,
                  icon: Icon(Icons.meeting_room),
                  items: <String>['Peter','Peter George '].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value)
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      userType = newValue!;
                    });
                  },
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
