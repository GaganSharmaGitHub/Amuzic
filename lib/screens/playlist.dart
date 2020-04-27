
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
        body: SonglistsBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.shuffle),        
        ),
        
      );
  }
}
class SonglistsBody extends StatefulWidget {
  @override
  _SonglistsBodyState createState() => _SonglistsBodyState();
}

class _SonglistsBodyState extends State<SonglistsBody> {

String playListId='PLaK0KGHQGBZtHJ-YqaLTmwBN2QrVmzQkJ';
String apiPlay;
List items=[];
void getSongLists() async{
  Map arg=ModalRoute.of(context).settings.arguments;
  playListId=arg['playId'];
 apiPlay='https://www.googleapis.com/youtube/v3/playlistItems?playlistId='+playListId+'&key='+apiKeyYT+'&part=snippet,id&maxResults=50';
Response rawdata = await get(apiPlay);
Map data= jsonDecode(rawdata.body);
setState(() {
items=data['items'];
  
});
//print(ModalRoute.of(context).settings.arguments);
}
  @override
  Widget build(BuildContext context) {
    getSongLists();
   return items.length!=0?
    
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    if(items[index]['snippet']["thumbnails"]==null){
      return SizedBox(height: 1,);
    }
    return Card(
      child: ListTile(
        title: Text(items[index]['snippet']['title']),
        onTap: (){},
        leading: CircleAvatar(backgroundImage: NetworkImage(items[index]['snippet']["thumbnails"]["default"]['url']),),
        trailing: Icon(Icons.play_arrow),
      ),
      color: Colors.deepOrange[300],
      
    );
  },
)
    :Center(child: SpinKitCubeGrid(
  color: Colors.deepOrangeAccent,
  size: 50.0,
),);
  }
}