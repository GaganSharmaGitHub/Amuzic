import 'package:flutter/material.dart';
import 'package:Amuzic/screens/firebase/signLogTabs.dart';
import 'package:provider/provider.dart';
import 'package:Amuzic/firebase/user.dart';
import 'package:Amuzic/screens/Loaders/loadPlaylist.dart';

class Check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //gettin();
    final user= Provider.of<User>(context);
    return user==null?SignLogScreen():LoadPlaylists();
  }
}