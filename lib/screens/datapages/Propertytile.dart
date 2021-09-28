import 'package:flutter/material.dart';
import 'package:booking_app/services/properties_class.dart';
class proptile extends StatelessWidget {

  final Properties p;

   proptile({required this.p});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0) ,
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey,

          ),
          title: Text(p.propName),
          subtitle: Text(p.location),
        ),
      ),
    );
  }
}
