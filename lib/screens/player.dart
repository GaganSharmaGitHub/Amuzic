
import 'package:flutter/material.dart';
class Playerlists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Player'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          //backgroundColor: Color(Colors.amber),
        ),
        body: Text('player'),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.shuffle),        
        ),
        
      );
  }
}


