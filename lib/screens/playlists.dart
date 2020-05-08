//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:Amuzic/components/listCard.dart';
class Playlists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Playlist'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, '/userOptions');
              },
             icon: Icon(Icons.person),
             label: Text('user'),)
          ],
          //backgroundColor: Color(Colors.amber),
        ),
        body: PlayerLists222(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, '/check');
          },
          child: Icon(Icons.shuffle),
          backgroundColor: Colors.deepOrangeAccent,        
        ),
        
      );
  }
}

  // Widget grid(){
  //   return GridView.count(crossAxisCount: 2,
  //   children: dataList.map((itemData){
  //        return ListCard(itemData);
  //       }).toList(),
  //   );
  // }
  Widget list(List arr, String str){
    if(str=='channel not found'){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("couldn't find data",
          
          style: TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: 20),),
          Card(
            color: Colors.redAccent,
            elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(image: AssetImage('image/amuzicLogo.png'),
                width: 50,),
                Column(
                    children: <Widget>[
                      Text('Seems like the channel id is incorrect',
                      style: TextStyle(color: Colors.white),),
                      Text('Tap to change your music list'),
                    ],
                ),
              ],
            ),
                  ),
          ),
        ],
      );
    }
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       Text(str,
       style: TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: 20),
         overflow: TextOverflow.ellipsis,
         maxLines: 1,
         ),
       (Container(
         height: 200,
      child: ListView(
      scrollDirection: Axis.horizontal,
      children: arr.map((itemData){
        return ListCard(itemData);
              }).toList(),
            ),
        )),
     ],
   );
  }
  class PlayerLists222 extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
     Map map=ModalRoute.of(context).settings.arguments;
    List dataList=map['dataArray'];

    return Container(
      child: ListView(children:dataList.map((f){
        return list(f['array'], f['title']);
        }).toList(),),
    );}
  }