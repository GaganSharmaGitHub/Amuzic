import 'package:Amuzic/screens/check.dart';
import 'package:Amuzic/screens/playlists.dart';
import 'package:flutter/material.dart';
import 'package:Amuzic/screens/playlist.dart';
import 'package:Amuzic/screens/player.dart';
import 'package:Amuzic/screens/loadSongs.dart';
import 'package:Amuzic/screens/loadPlaylist.dart';
String apiPlayList='https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=UCBkNpeyvBO2TdPGVC_PsPUA&key=AIzaSyDIZ-R-Gh2Hs7TWLGpfPdmRLyjmeYhpbtg';
void main() => runApp(
   MaterialApp(
      title: 'Welcome to Flutter',
      initialRoute: '/loadPlaylists',
      routes: {
        '/loadPlaylists':(context)=>LoadPlaylists(),
        '/playlists':(context)=>Playlists(),
        '/songList':(context)=>Songlists(),
        '/player':(context)=> Player(),
        '/loadSongs':(context)=>LoadSongs(),
        '/check':(context)=>Check(),

      },
    )
);
