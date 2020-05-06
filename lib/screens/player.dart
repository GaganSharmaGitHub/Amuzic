import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

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
        body:InkWell(
                  child: Column(
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
                
                Center(
                  child: FlatButton(
                    child: Icon(Icons.home,
                    color: Colors.white,),
                    
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/loadPlaylists');
                     },
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              Row(children: <Widget>[
              InkWell(
                child: Image.network(playlist[index==0?playlist.length-1:index-1]['img']),
              onTap: (){
                  Navigator.pushReplacementNamed(context, '/player', arguments: {'playList':playlist, 'index':index==0?playlist.length-1:index-1,'playlistName': playListName});
              },
              splashColor: Colors.deepOrangeAccent,
              ),
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
                  Navigator.pushNamed(context, '/loadPlaylists');
                },),
                InkWell(child: Image.network(playlist[index>=playlist.length-1?0:index+1]['img']),
                onTap: (){
                  Navigator.pushReplacementNamed(context, '/player', arguments: {'playList':playlist, 'index':index>=playlist.length-1?0:index+1,'playlistName': playListName});
              },
              splashColor: Colors.deepOrangeAccent,
                ),
              ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(height: 50,),
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
            ],
          ),
          splashColor: Colors.deepOrangeAccent,
          onDoubleTap: (){_controller.play();},
          onTap: (){_controller.pause();},
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrangeAccent,
          splashColor: Colors.white,
          onPressed: (){
            playlist.shuffle();
            Navigator.pushReplacementNamed(context, '/check', 
            arguments: {'playList':playlist, 'index':0,'playlistName': playListName});
          },
          child: Icon(Icons.shuffle),        
        ),
        
      );
  }
}

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ;
  }
}