
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:Amuzic/apiKeyYT.dart';
import 'package:http/http.dart';
class Songlists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Song'),
          elevation: 0,
          backgroundColor: Colors.deepOrangeAccent,

          centerTitle: true,
          //backgroundColor: Color(Colors.amber),
        ),
        body: MusicList(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.shuffle),        
        ),
        
      );
  }
}
class MusicList extends StatefulWidget {
  @override
  _MusicListState createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  List dataList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Map map=ModalRoute.of(context).settings.arguments;
    List dataArray=map['dataArray'];
   // //dataArray[0]);
    
    return Container(
      child: ListView.builder(itemBuilder:(context,index){

        return Card(child: ListTile(onTap: (){
          Navigator.pushNamed(context, '/player', arguments: {'playId':dataArray[index]['id']});
        },
        title: Text(dataArray[index]['snippet']['title']),
        leading: CircleAvatar(backgroundImage: NetworkImage(dataArray[index]['snippet']['thumbnails']['default']['url']),),
        ),
        );
      },
      itemCount: dataArray.length),
    );
  }
}