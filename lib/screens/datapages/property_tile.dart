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
          title: Text(props.propName),
          subtitle: Text(props.location),
        ),
      ),
    );
  }
}
