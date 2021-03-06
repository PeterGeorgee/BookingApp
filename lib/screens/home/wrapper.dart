import 'package:booking_app/models/user.dart';
import 'package:booking_app/screens/authentication/authenticate.dart';
import 'package:booking_app/screens/datapages/mainPage.dart';
import 'package:booking_app/screens/datapages/properties_list.dart';
import 'package:booking_app/services/GetPropdata.dart';
import 'package:booking_app/services/properties_class.dart';
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
      return StreamProvider<List<Properties>>.value(child: MainPage(),
      value: getpropertiesfromdatabase().propers, initialData: [],);
    }
  }
}
