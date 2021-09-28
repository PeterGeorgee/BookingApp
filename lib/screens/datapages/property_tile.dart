import 'package:booking_app/screens/datapages/property_data.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/services/properties_class.dart';

class PropertyTile extends StatelessWidget {
  final Properties props;


  PropertyTile({required this.props});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PropertyData(MyProperty: props, )));
          },
          title: Text(props.propName),
          subtitle: Text(props.location),
        ),
      ),
    );
  }
}
