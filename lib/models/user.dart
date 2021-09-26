class UID{
  final String uid;

  UID({required this.uid});
}

class user{
  String firstName;
  String lastName;
  String phoneNum;
  String pass;
  String username;
  bool isOwner;

  user({required this.firstName, required this.lastName, required this.phoneNum, required this.pass, required this.username,
      required this.isOwner});
}