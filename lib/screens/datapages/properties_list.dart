import 'package:booking_app/screens/datapages/profile.dart';
import 'package:booking_app/screens/datapages/property_tile.dart';
import 'package:booking_app/screens/home/wrapper.dart';
import 'package:booking_app/services/properties_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PropertiesList extends StatefulWidget {
  const PropertiesList({Key? key}) : super(key: key);

  @override
  _PropertiesListState createState() => _PropertiesListState();
}

class _PropertiesListState extends State<PropertiesList> {

  List<Properties> propsOnSearch=[];
  int _currentIndex=0;


  TextEditingController? _textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final properties=Provider.of<List<Properties>>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(30)),
          child: TextField(
            onChanged: (value){
              setState(() {
                propsOnSearch=properties.where((element) => element.propName.toLowerCase().startsWith(value)).toList();
              });
            },
            controller: _textEditingController,
            decoration: InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Search...'
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            propsOnSearch.clear();
            _textEditingController!.clear();
            setState(() {
              _textEditingController!.text='';
            });
          },
              child: Icon(Icons.close,color: Colors.black,)),
          FlatButton.icon(
            onPressed: ()async{
              await FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout,color: Colors.white,),
            label: Text('Logout',style: TextStyle(color: Colors.white),),
          )
        ],
      ),
      body: _textEditingController!.text.isNotEmpty&&propsOnSearch.isEmpty?
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search_off,size: 70.0,),
              SizedBox(height:15.0),
              Text(
                'No results found',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ):
      ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context,index){
          return PropertyTile(props: properties[index]);
        },
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         title: Text('Home'),
      //         backgroundColor: Colors.black
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         title: Text('Profile'),
      //         backgroundColor: Colors.black
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.logout),
      //         title: Text('Logout'),
      //         backgroundColor: Colors.black
      //     ),
      //   ],
      //   onTap: (index) async {
      //     setState(() {
      //       _currentIndex=index;
      //     });
      //     if(index==0){
      //       Navigator.push(context, MaterialPageRoute(builder: (context) => Wrapper()),);
      //     }
      //     else if(index==1){
      //       Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()),);
      //     }
      //     else {
      //       await FirebaseAuth.instance.signOut();
      //       //Navigator.push(context, MaterialPageRoute(builder: (context) => Wrapper()),);
      //     }
      //   },
      // ),
    );
  }
}