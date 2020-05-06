import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:Amuzic/apiKeyYT.dart';
import 'package:http/http.dart';
class LoadPlaylists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoadPlaylistLoader(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.shuffle),        
        ),
        
      );
  }
}
class LoadPlaylistLoader extends StatefulWidget {
  @override
  _LoadPlaylistLoaderState createState() => _LoadPlaylistLoaderState();
}

class _LoadPlaylistLoaderState extends State<LoadPlaylistLoader> {
  List dataList=[];
  String passtt;
  void getData() async{
   // Response response=await get('https://www.googleapis.com/youtube/v3/playlistItems?playlistId='+idarg+'&key='+apiKeyYT+'&part=snippet,id&maxResults=50');
    Response response=await get('https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=UCb1OXo_THQYF3lEuM2cjCkw&key='+apiKeyYT);
   
    var jsonRes=jsonDecode(response.body);
    ////jsonRes);
    setState(() {
      dataList= jsonRes['items'];
      List dataToSend=[];
    dataList.forEach((f){
      dataToSend.add({
        'id':f['id'],
        'img':f['snippet']['thumbnails']['default']['url'],
        'title':f['snippet']['title']
      });
    });
      Navigator.pushReplacementNamed(context, '/playlists', arguments: {'dataArray':dataToSend,});
    });
  }
  @override
  Widget build(BuildContext context) {   
    //..Map map=ModalRoute.of(context).settings.arguments;
    //String id=map['playId'];

    getData();
    return Container(
      child: Center(
        child: SpinKitWave(
             color: Colors.deepOrangeAccent,
             size: 50.0,
        )),
    );
  }
}