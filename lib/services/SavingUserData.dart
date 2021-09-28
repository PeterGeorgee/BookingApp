import 'package:cloud_firestore/cloud_firestore.dart';
class saveuserdata{
  final CollectionReference usercollection=FirebaseFirestore.instance.collection('Users');
  final String userid;
  saveuserdata({required this.userid});
  Future UpdateUserData(String firstname,String Lastname,String UserName,bool isnormaluser,String phonenumber) async
  {
    return await usercollection.doc(userid).set({
      'FirstName' : firstname,
      'LastName' : Lastname,
      'PhoneNumber' : phonenumber,
      'Username' : UserName,
      'isOwner' : isnormaluser
    });

  }
}