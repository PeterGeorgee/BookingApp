import 'package:booking_app/screens/datapages/property_data.dart';
import 'package:booking_app/services/properties_class.dart';
import 'package:flutter/material.dart';

class PropertiesList extends StatefulWidget {
  const PropertiesList({Key? key}) : super(key: key);

  @override
  _PropertiesListState createState() => _PropertiesListState();
}

class _PropertiesListState extends State<PropertiesList> {

  List<Properties> propsOnSearch=[];

  List<Properties> props=[
    Properties(ownerName:'Peter George', propID:1, propName:'Beit el Wadi', location:'Wadi El natroon'),
    Properties(ownerName:'Peter Magdy', propID:2, propName:'Beit el Salam', location:'Agamy'),
    Properties(ownerName:'Abadeer Afif', propID:3, propName:'Beit el Merryland', location:'Obour'),
    Properties(ownerName:'Kareem', propID:4, propName:'Beit Sam3an el Kharaz', location:'Wadi El natroon'),
  ];

  void viewProperty(index){
    Properties instance=_textEditingController!.text.isNotEmpty?propsOnSearch[index]:props[index];
    // Navigator.pushNamed(context,'/propData',arguments: {
    //   'propName':instance.propName,
    //   'owner':instance.ownerName,
    //   'loc':instance.location,
    // });
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PropertyData(MyProperty: instance, )));
  }

  TextEditingController? _textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(30)),
          child: TextField(
            onChanged: (value){
              setState(() {
                propsOnSearch=props.where((element) => element.propName.toLowerCase().contains(value)).toList();
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
              child: Icon(Icons.close,color: Colors.black,))
        ],
      ),
      body: _textEditingController!.text.isNotEmpty&&propsOnSearch.isEmpty?
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search_off,size: 90.0,),
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
        itemCount: _textEditingController!.text.isNotEmpty?propsOnSearch.length:props.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  viewProperty(index);
                },
                title: Text(
                    _textEditingController!.text.isNotEmpty?propsOnSearch[index].propName:props[index].propName
                ),
                subtitle: Text(_textEditingController!.text.isNotEmpty?propsOnSearch[index].location:props[index].location),
                // leading: CircleAvatar(
                //   backgroundImage: AssetImage('assets/${_textEditingController!.text.isNotEmpty?locationsOnSearch[index].flag:locations[index].flag}'),
                // ),
              ),
            ),
          );
        },
      ),
    );
  }
}
