
import 'dart:collection';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/services/properties_class.dart';
class getpropertiesfromdatabase
{
  final CollectionReference props = FirebaseFirestore.instance.collection('Properties');
  Stream<List<Properties>> get propers{
    return props.snapshots().map(_properlistfromsnapshots);
  }
  List<Halls> tohallslist(List<dynamic> halls)
  {
    List<Halls> placehalls=[];
    halls.forEach((element) {
      LinkedHashMap e=element;
      e.forEach((key, value) {
        String hallname='';
        int hallcap=0;
        if(key=='hallname')
          hallname=value;
        else if(key=='hallCapacity')
          hallcap=int.parse(value) ;
        placehalls.add(Halls(hallName: hallname,hallCapacity: hallcap));



      });
    });
    return placehalls;

  }
  List<section> tosectionslist(List<dynamic> sectionsj)
  {
    List<section> placesections=[];

    sectionsj.forEach((element) {
      LinkedHashMap e=element;
      e.forEach((key, value) {
        String sectionname='';
        List<Room> prooms=[];
        if(key=='sectionName')
          sectionname=value;

        else if(key=='sectionRooms')
          {
            List<dynamic> rooms=value;
            rooms.forEach((element) {
              LinkedHashMap roomsjson=element;

              roomsjson.forEach((key, value) {
                int numberofrooms=0;
                String roomname='';
                int cap=0;
                if(key=='numberOfRooms')
                  numberofrooms=int.parse(value);
                else if(key=='roomName')
                  roomname=value;
                else if(key=='capacity')
                  cap=int.parse(value);
                prooms.add(Room(numOfRooms: numberofrooms,roomName: roomname,roomCapacity: cap));
              });

            });
          }
        placesections.add(section(sectionname: sectionname,rooms: prooms));



      });
    });
    return placesections;

  }




  List<Properties> _properlistfromsnapshots(QuerySnapshot snapshot)
  {

    return snapshot.docs.map((doc) {
     List<dynamic> halls= doc.get('halls')??'';
     List<dynamic> sections= doc.get('sections')??'';
     List<Halls> placehalls=tohallslist(halls);
     List<section> placesections=tosectionslist(sections);



      return Properties(propID: doc.id, propName: doc.get('name')??'', location: doc.get('location')??'',ownerName:'anything',halls: placehalls,secs: placesections);

    }).toList();


  }
  void getproperties()
  {
    List<Properties> p=[];
    props.where("name",isNotEqualTo: null).get().then((value) {
      value.docs.forEach((element) {
        print(element.data());
        int x=3;


      });
      
    });




  }



}
