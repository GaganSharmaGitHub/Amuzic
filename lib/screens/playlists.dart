import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:Amuzic/apiKeyYT.dart';
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
        body: ListOfPlayList(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.shuffle),        
        ),
        
      );
  }
}
class ListOfPlayList extends StatefulWidget {
  @override
  _ListOfPlayListState createState() => _ListOfPlayListState();
}

class _ListOfPlayListState extends State<ListOfPlayList> {
  List dataList=[];
  void getData() async{
    Response response=await get('https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=UCb1OXo_THQYF3lEuM2cjCkw&key='+apiKeyYT);
    var jsonRes=jsonDecode(response.body);

    setState(() {
      dataList= jsonRes['items'];
      
    });
  }
  Widget grid(){
    return GridView.count(crossAxisCount: 2,
    children: dataList.map((itemData){
         return ListCard(itemData);
        }).toList(),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: dataList.isEmpty?Text('load'):grid()
    );
  }
}

