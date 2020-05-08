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
          FlatButton(child: Text('signOut'),
          onPressed: (){
            var signOut=_auth.signOut();
            if(signOut!=null){
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/check');
            }else{
              print('fail');
            }
          },
          )
        ],
      ),
      );
  }
}