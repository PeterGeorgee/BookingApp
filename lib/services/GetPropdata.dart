import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/services/properties_class.dart';
class getpropertiesfromdatabase
{
  final CollectionReference props = FirebaseFirestore.instance.collection('Properties');
  Stream<List<Properties>> get propers{
    return props.snapshots().map(_properlistfromsnapshots);
  }

  List<Properties> _properlistfromsnapshots(QuerySnapshot snapshot)
  {

    return snapshot.docs.map((doc) {
      return Properties(propID: doc.id, propName: doc.get('name')??'', location: doc.get('location')??'',ownerName:'anything');

    }).toList();
  }



}