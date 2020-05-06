import 'package:flutter_spinkit/flutter_spinkit.dart';
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

          //backgroundColor: Color(Colors.amber),
        ),
        body: PlayerLists222(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/check');
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
   return Column(
     children: <Widget>[
       Text(str),
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
        child:list(dataList,'channel Lists')
    );}
  }