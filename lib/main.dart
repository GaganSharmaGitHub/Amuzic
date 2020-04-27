import 'package:Amuzic/screens/playlists.dart';
import 'package:flutter/material.dart';
import 'package:Amuzic/screens/playlist.dart';
import 'package:Amuzic/screens/player.dart';
String apiPlayList='https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=UCBkNpeyvBO2TdPGVC_PsPUA&key=AIzaSyDIZ-R-Gh2Hs7TWLGpfPdmRLyjmeYhpbtg';
void main() => runApp(
   MaterialApp(
      title: 'Welcome to Flutter',
      initialRoute: '/playlists',
      routes: {
        '/playlists':(context)=>Playlists(),
        '/songList':(context)=>Songlists(),
        '/player':(context)=> Playerlists()

      },
    )
);
