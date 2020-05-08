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
        backgroundColor: Colors.white,        
      );
  }
}
class LoadPlaylistLoader extends StatefulWidget {
  @override
  _LoadPlaylistLoaderState createState() => _LoadPlaylistLoaderState();
}

class _LoadPlaylistLoaderState extends State<LoadPlaylistLoader> {
  List dataList=[];
  String passtt='foo';
  getAll(List cLit) async{
   var cList= cLit.toSet();
    //var data = await getData(cList[0]);
    List<Future> dataSending;
    
    dataSending= cList.map((f){return getData(f);}).toList();
    List sent =await Future.wait(dataSending);
  Navigator.pushReplacementNamed(context, '/playlists', arguments: {'dataArray':sent,});
    
  }
  Future getData(String cId) async{
    Response response=await get('https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId='+cId+'&key='+apiKeyYT); 
    Map jsonRes=jsonDecode(response.body); 
    if(jsonRes.containsKey('error')){
    return {
      'title':'channel not found',
      'array':[]
    };
    } 
    List  dataitem= jsonRes['items'];
    String channelName= dataitem[0]['snippet']['channelTitle'];
      List dataOfChannel= dataitem.map((f){
        
        return {
        'id':f['id'],
        'img':f['snippet']['thumbnails']['standard']['url'],
        'title':f['snippet']['title']
      };
      }).toList();
      Map senD={'array':dataOfChannel,'title':channelName};
      return senD;
  }
  @override
  Widget build(BuildContext context) {   
    //..Map map=ModalRoute.of(context).settings.arguments;
    //String id=map['playId'];
getAll(['UCb1OXo_THQYF3lEuM2cjCkw','UCl2qXNHvpjHldVFM-_ENM9Q','hhhhh','UCPVhZsC2od1xjGhgEc2NEPQ','UC9upJolQXBBEAiRDKNcf2YA']);
    //getData();
    return Container(
      child: Center(
        child:
        SpinKitWave(
                 color: Colors.deepOrangeAccent,
                 size: 50.0,
            )
        ),
    );
  }
}