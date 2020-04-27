import 'package:flutter/material.dart';
class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
          elevation: 0,
        ),
        body: Center(
          child:  Text('Home'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Text('tap'),        
        ),
        
      );
  }
}