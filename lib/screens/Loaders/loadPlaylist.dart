import 'package:Amuzic/firebase/user.dart';
import 'package:Amuzic/firebase/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:Amuzic/apiKeyYT.dart';
import 'package:http/http.dart';
class LoadPlaylists extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<User>(context);
    return Scaffold(
        body: LoadPlaylistLoader(uid: user.uid,),
        backgroundColor: Colors.white,        
      );
  }
}
class LoadPlaylistLoader extends StatefulWidget {
  final String uid;
  
  LoadPlaylistLoader({this.uid});
  @override
  _LoadPlaylistLoaderState createState() => _LoadPlaylistLoaderState();
}

class _LoadPlaylistLoaderState extends State<LoadPlaylistLoader> {
  List dataList=[];
  String passtt='foo';
  getAll(List cLit,bool fromPlayer) async{
   var cList= cLit.toSet();
    //var data = await getData(cList[0]);
    List<Future> dataSending;
    
    dataSending= cList.map((f){return getData(f);}).toList();
    List sent =await Future.wait(dataSending);
  Navigator.pushReplacementNamed(context, '/playlists', arguments: {'dataArray':sent,'fromPlayer':fromPlayer});
    
  }
  getDataBase(bool fromPlayer) async{
  final DatabaseService db= DatabaseService(uid: widget.uid);
  List cList= await db.getChannels();
  getAll(cList, fromPlayer);
   
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
    Map map=ModalRoute.of(context).settings.arguments;
    if(map==null){
    getDataBase(false);
    }else{
    getDataBase(true);
    }
    //String id=map['playId'];
    //getData();
    return Container(
      child: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SpinKitWave(
                     color: Colors.deepOrangeAccent,
                     size: 50.0,
                ),
            Text('if this is taking to long try removing few channels'),
            FlatButton(
              child: Text('User Options'),
              onPressed: (){
                Navigator.pushNamed(context, '/userOptions');
              },
              color: Colors.deepOrangeAccent,
            )
          ],
        )
        ),
    );
  }
}