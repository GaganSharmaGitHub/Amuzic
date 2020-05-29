import 'package:flutter/material.dart';
import 'package:Amuzic/firebase/auth.dart';

class ProfileOp extends StatefulWidget {
  @override
  _ProfileOpState createState() => _ProfileOpState();
}

class _ProfileOpState extends State<ProfileOp> {
  AuthServices _authServices=AuthServices();
  var profile;
  void getStuff() async{
   _authServices.imgNname().then((onValue){
     setState(() {
       profile=onValue;
     });
   });
  }
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getStuff();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
appBar:AppBar(
  backgroundColor: Colors.deepOrangeAccent,
  title: Text('Profile'),
) ,
body: Column(
  children: <Widget>[
     Padding(
       padding: const EdgeInsets.all(12.0),
       child: CircleAvatar(
         backgroundImage: NetworkImage(''),
         radius: 50,
       ),
     ),
     Text(profile.displayName==null?'user':profile.displayName),
     Column(
       children: <Widget>[
         ListTile(leading: Icon(Icons.person),
         title: Text('Profile'),
         ),
         ListTile(leading: Icon(Icons.music_video),
         title: Text(profile.email),
         onTap: (){
           Navigator.pushNamed(context, '/loadChannels');
         },
         ),
         ListTile(leading: Icon(Icons.playlist_play),
         title: Text('My Playlists'),
         ),
         ListTile(leading: Icon(Icons.delete),
         title: Text('Delete'),
         onTap: (){
           _authServices.deleteUser();
         },
         ),
         
       ],
     ),
     ],
    ),
   );
  }
}