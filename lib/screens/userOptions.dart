import 'package:flutter/material.dart';
import 'package:Amuzic/firebase/auth.dart';

class UserOptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final AuthServices _auth= AuthServices();
    return Scaffold(
appBar:AppBar(
  backgroundColor: Colors.deepOrangeAccent,
  title: Text('User Options'),
) ,
body: Column(
  children: <Widget>[
     Padding(
       padding: const EdgeInsets.all(12.0),
       child: CircleAvatar(
         backgroundImage: AssetImage('image/amuzicLogo.png'),
         radius: 50,
       ),
     ),
     Column(
       children: <Widget>[
         ListTile(leading: Icon(Icons.person),
         title: Text('Profile'),
         ),
         ListTile(leading: Icon(Icons.music_video),
         title: Text('My channels'),
         onTap: (){
           Navigator.pushNamed(context, '/loadChannels');
         },
         ),
         ListTile(leading: Icon(Icons.playlist_play),
         title: Text('My Playlists'),
         ),
         ListTile(leading: Icon(Icons.exit_to_app),
         title: Text('SignOut'),
         onTap: () async{
          var signOut= _auth.signOut();
          if(signOut==null){
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Failed to SignOut try again'))
            );
          }else{
            Navigator.pop(context);
            Navigator.popAndPushNamed(context, '/check');
          }
         },
         ),
         
       ],
     ),
     ],
    ),
   );
  }
}