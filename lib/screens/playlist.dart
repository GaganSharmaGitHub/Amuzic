import 'package:flutter/material.dart';
class Songlists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map map=ModalRoute.of(context).settings.arguments;
    List playlist=map['dataArray'];

    return Scaffold(
      appBar: AppBar(
        title: Text(map['title']),
        elevation: 0,
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
      ),
        body: MusicList(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            playlist.shuffle();
            Navigator.pushReplacementNamed(
              context, '/songList',
               arguments: {
                 'dataArray':playlist,
                 'title':map['title']
                 }
                 );
          },
        child: Icon(Icons.shuffle),        
          backgroundColor: Colors.deepOrangeAccent,        
      ),  
    );
  }
}

class MusicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map map=ModalRoute.of(context).settings.arguments;
     List dataArray=map['dataArray'];
    String playlistName=map['title'];
   
    return Container(
      child: ListView.builder(itemBuilder:(context,index){

        return Card(child: ListTile(onTap: (){
          Navigator.pop(context);
        
         Navigator.pushReplacementNamed(context, '/player', arguments: {'playList':dataArray, 'index':index,'playlistName': playlistName});
        //print('gaganKadat: '+dataArray[index]['snippet']);
        },
        title: Text(dataArray[index]['title']),
        leading: CircleAvatar(backgroundImage: NetworkImage(dataArray[index]['img']),),
        ),
        );
      },
      itemCount: dataArray.length),
    );
  }
}