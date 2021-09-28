class Properties{
  String ownerName;
  String propID;
  String propName;
  String location;
  List<sectionRooms> secs=[];
  List<Halls> halls=[];

  Properties({required this.ownerName, required this.propID, required this.propName, required this.location});

}
class Halls{
  String hallName;
  int hallCapacity;

  Halls({required this.hallName, required this.hallCapacity});
}

class sectionRooms{
  int numOfRooms;
  int roomCapacity;
  String roomName;

  sectionRooms({required this.numOfRooms, required this.roomCapacity, required this.roomName});
}