import 'package:booking_app/models/user.dart';
import 'package:booking_app/screens/authentication/authenticate.dart';
import 'package:booking_app/screens/datapages/properties_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user=Provider.of<UID?>(context);

    if(user==null){
      return Authenticate();
    }
    else{
      return PropertiesList();
    }
  }
}