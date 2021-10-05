class Properties{
  String ownerName;
  String propID;
  String propName;
  String location;
  List<section> secs=[];
  List<Halls> halls=[];

  Properties({required this.ownerName, required this.propID, required this.propName, required this.location,required this.halls,required this.secs});

}
class Halls{
  String hallName;
  int hallCapacity;

  Halls({required this.hallName, required this.hallCapacity});
}

class section{
  String sectionname;
  List<Room> rooms;

  section({required this.rooms,required this.sectionname});
}
class Room{
  int numOfRooms;
  int roomCapacity;
  String roomName;

  Room({required this.numOfRooms, required this.roomCapacity, required this.roomName});

}
