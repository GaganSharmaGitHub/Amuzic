import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';
import 'package:Amuzic/components/playerButtons.dart';
class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map map=ModalRoute.of(context).settings.arguments;
    int index=map['index'];
    List playlist=map['playList'];
    String playListName=map['playlistName'];
    YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: playlist[index]['vid'],
    flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
          
    ),
    );
//    var playing=PlayerState.playing;
    return Scaffold(
        body: Column(
         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
 children: <Widget>[
       YoutubePlayer(
controller: _controller,
bottomActions: <Widget>[
],
onReady: (){
_controller.setPlaybackRate(1.75);
},
onEnded: (k){
     Navigator.pushReplacementNamed(context, '/player', arguments: {'playList':playlist, 'index':index>=playlist.length-1?0:index+1,'playlistName': playListName});
  },
 ),
 
   Expanded(
          flex: 1, 
          child: Container(),
        ),
  Padding(
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
            CustomPlayPauseButton(funcTwo: _controller.mute,
                  funcOne: _controller.unMute,
                  icon1: Icons.volume_off,
                  icon2: Icons.volume_up,),
            CustomPlayPauseButton(funcOne: _controller.play,
                  funcTwo: _controller.pause,
                  icon1: Icons.play_arrow,
                  icon2: Icons.pause,),

          CustomSpeedController(func: _controller.setPlaybackRate,)

           ],
         ),
  ),
   Row(children: <Widget>[
   InkWell(
     child: Image.network(playlist[index==0?playlist.length-1:index-1]['img'],
     width: 150,),
   onTap: (){
       Navigator.pushReplacementNamed(context, '/player', arguments: {'playList':playlist, 'index':index==0?playlist.length-1:index-1,'playlistName': playListName});
   },
   splashColor: Colors.deepOrangeAccent,
   ),
     FlatButton(shape: CircleBorder(),
     color: Colors.deepOrangeAccent,
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Icon(Icons.home,
       color: Colors.white,
       size: 40,
       ),
     ),
     onPressed: (){
    Navigator.pushReplacementNamed(context, '/loadPlaylists');

     },),
     InkWell(child: Image.network(playlist[index>=playlist.length-1?0:index+1]['img'],
     width: 150,),
     onTap: (){
       Navigator.pushReplacementNamed(context, '/player', arguments: {'playList':playlist, 'index':index>=playlist.length-1?0:index+1,'playlistName': playListName});
   },
   splashColor: Colors.deepOrangeAccent,
     ),
   ],
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
   ),
   Expanded(
          flex: 3, 
          child: Container(),
        ),
    
  Text(playListName ,
  style:  TextStyle(
     color: Colors.deepOrangeAccent,
     fontWeight: FontWeight.bold,
     fontSize: 20
     ),),
   Text('Now Playing:',
   style: TextStyle(
     color: Colors.deepOrangeAccent,
     fontWeight: FontWeight.bold,
     fontSize: 18
     ),
     ),
   Text(playlist[index]['title'],
   style: TextStyle(fontSize: 20),),
   
    Expanded(flex: 1,
    child: Container(),),
   Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton(shape: CircleBorder(),
       color: Colors.deepOrangeAccent,
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Icon(Icons.playlist_play,
         color: Colors.white,
         size: 40,
         ),
       ),
       onPressed: (){
         Navigator.pushNamed(context, '/loadPlaylists', arguments: {'fromPlayer':true});
      //Navigator.pushReplacementNamed(context, '/loadPlaylists');

       },),
        FlatButton(shape: CircleBorder(),
       color: Colors.deepOrangeAccent,
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Icon(Icons.shuffle,
         color: Colors.white,
         size: 40,
         ),
       ),
       onPressed: (){
playlist.shuffle();
 Navigator.pushReplacementNamed(
   context, '/player', 
 arguments: {'playList':playlist, 'index':0,'playlistName': playListName});
          
       },),
       FlatButton(shape: CircleBorder(),
       color: Colors.deepOrangeAccent,
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Icon(Icons.replay,
         color: Colors.white,
         size: 40,
         ),
       ),
       onPressed: (){
        _controller.seekTo(Duration(seconds: 0));
       },),
       
      ],
    ),
    Expanded(flex: 1,
    child: Container(),),
Container(
         height: 100,
         color: Colors.deepOrangeAccent,
      child: ListView(
      scrollDirection: Axis.horizontal,
      controller: ScrollController(initialScrollOffset: index*150.0),
      children: 
playlist.asMap().entries.map((entry) {
    int idx = entry.key;
    Map val = entry.value;

    return InkWell(
     child: Image.network(val['img'],
     width: 150,
     ),
     
   onTap: (){
       Navigator.pushReplacementNamed(context, '/player', arguments: {'playList':playlist, 'index':idx,'playlistName': playListName});
   },
   splashColor: Colors.deepOrangeAccent,
   );
}).toList(),
            ),
        )
 ],
          ),
        
      );
  }
}
