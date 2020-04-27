import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:Amuzic/apiKeyYT.dart';
class Playlists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Playlist'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,

          //backgroundColor: Color(Colors.amber),
        ),
        body: PlaylistsBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.shuffle),        
        ),
        
      );
  }
}
class PlaylistsBody extends StatefulWidget {
  @override
  _PlaylistsBodyState createState() => _PlaylistsBodyState();
}

class _PlaylistsBodyState extends State<PlaylistsBody> {

String channelId='UCb1OXo_THQYF3lEuM2cjCkw';
String apiPlayList;
List items=[];
void getPlayLists() async{
Response rawdata = await get(apiPlayList);
Map data= jsonDecode(rawdata.body);

setState(() {
items=data['items'];
  
});
print(items[0]['snippet']["thumbnails"]["default"]);
}
@override
  void initState() {
    super.initState();
 apiPlayList='https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId='+ channelId +'&key='+ apiKeyYT;
    getPlayLists();
  }
  @override
  Widget build(BuildContext context) {
    return items.length!=0?
    GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: items.map((data){
    return InkWell(
      onTap:(){
          Navigator.pushNamed(context, '/songList', arguments: {'playId':data['id']});

      } ,
          child: Card(
      color: Colors.deepOrange[300],

            child: Container(child: 
        Column(children: <Widget>[
          SizedBox(height: 15,),
          CircleAvatar(backgroundImage: NetworkImage(data['snippet']["thumbnails"]["standard"]['url']),
          radius: 50,),      
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Text(data['snippet']['title'], 
                style: TextStyle(fontWeight: FontWeight.bold),),
                Icon(Icons.keyboard_arrow_right)
              
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ],
        ),
        ),
      ),
      splashColor: Colors.blue,
    );
  }).toList(),
)
    :Center(child: SpinKitCubeGrid(
  color: Colors.deepOrangeAccent,
  size: 50.0,
),);
  }
}


   
/*ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return Card(
      child: ListTile(
        title: Text(items[index]['snippet']['title']),
        onTap: (){
          Navigator.pushNamed(context, '/songList', arguments: {'playId':items[index]['id']});
        },
        leading: CircleAvatar(backgroundImage: NetworkImage(items[index]['snippet']["thumbnails"]["default"]['url']),),
        trailing: Icon(Icons.play_arrow),
      ),
    );
  },
)*/