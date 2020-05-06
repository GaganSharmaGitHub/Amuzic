import 'package:flutter/material.dart';
import 'package:youtube_extractor/youtube_extractor.dart';

var extractor = YouTubeExtractor();

void gettin() async {
  // Get the stream info for the passed video
  var streamInfo = await extractor.getMediaStreamsAsync('a1ExYqrBJio');
  // Print the audio stream url
  print('Audio URL: ${streamInfo.audio.first.url}');
}

class Check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    gettin();
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Playlist'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,

          //backgroundColor: Color(Colors.amber),
        ),
        body: Text('hi'),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.shuffle),        
        ),
        
      );
  }
}