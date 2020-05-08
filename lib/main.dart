import 'package:Amuzic/firebase/auth.dart';
import 'package:provider/provider.dart';
import 'package:Amuzic/screens/check.dart';
import 'package:Amuzic/screens/playlists.dart';
import 'package:flutter/material.dart';
import 'package:Amuzic/screens/playlist.dart';
import 'package:Amuzic/screens/player.dart';
import 'package:Amuzic/screens/Loaders/loadSongs.dart';
import 'package:Amuzic/screens/Loaders/loadPlaylist.dart';
import 'package:Amuzic/screens/userOptions.dart';
//String apiPlayList='https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=UCBkNpeyvBO2TdPGVC_PsPUA&key=AIzaSyDIZ-R-Gh2Hs7TWLGpfPdmRLyjmeYhpbtg';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: AuthServices().user,
          child: MaterialApp(
        title: 'Amuzic',
        initialRoute: '/check',
        routes: {
          '/loadPlaylists':(context)=>LoadPlaylists(),
          '/playlists':(context)=>Playlists(),
          '/songList':(context)=>Songlists(),
          '/player':(context)=> Player(),
          '/loadSongs':(context)=>LoadSongs(),
          '/check':(context)=>Check(),
          '/userOptions':(context)=>UserOptionsScreen()
        },
      ),
    );
  }
}