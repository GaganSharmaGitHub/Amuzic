import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

class Playerlists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map map=ModalRoute.of(context).settings.arguments;
    String id=map['playId'];
    YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: id,
    flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
    ),
);

    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Player'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          //backgroundColor: Color(Colors.amber),
        ),
        body:YoutubePlayer(
    controller: _controller,
),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.shuffle),        
        ),
        
      );
  }
}


