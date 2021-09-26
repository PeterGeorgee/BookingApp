import 'package:booking_app/models/user.dart';
import 'package:booking_app/services/properties_class.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';



class PropertyData extends StatelessWidget {
  PropertyData({Key? key,required this.MyProperty}) : super(key: key);

  final Properties MyProperty;

  //Map data={};
  List <String> imagelist=[
    'assets/egypt.png',
    'assets/egypt 1.jpg',
    'assets/egypt 2.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    //data=data.isNotEmpty?data:ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(MyProperty.propName),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(MyProperty.propName,style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                SizedBox(height: 5.0,),
                Text(MyProperty.location,style: TextStyle(fontSize: 15.0),),
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

