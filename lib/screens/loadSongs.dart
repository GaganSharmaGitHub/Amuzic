import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:Amuzic/apiKeyYT.dart';
import 'package:http/http.dart';
class LoadSongs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoadSongLoader(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.shuffle),        
        ),
        
      );
  }
}
class LoadSongLoader extends StatefulWidget {
  @override
  _LoadSongLoaderState createState() => _LoadSongLoaderState();
}

class _LoadSongLoaderState extends State<LoadSongLoader> {
  List dataList=[];
  void getData(String idarg) async{
    Response response=await get('https://www.googleapis.com/youtube/v3/playlistItems?playlistId='+idarg+'&key='+apiKeyYT+'&part=snippet,id&maxResults=50');
    var jsonRes=jsonDecode(response.body);
    ////jsonRes);
    setState(() {
      dataList= jsonRes['items'];
      Navigator.pushReplacementNamed(context, '/songList', arguments: {'dataArray':dataList});
    });
  }
  @override
  Widget build(BuildContext context) {   
    Map map=ModalRoute.of(context).settings.arguments;
    String id=map['playId'];
    getData(id);
    return Container(
      child: Center(
        child: SpinKitWave(
             color: Colors.deepOrangeAccent,
             size: 50.0,
        )),
    );
  }
}