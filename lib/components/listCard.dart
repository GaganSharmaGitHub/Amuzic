import 'package:flutter/material.dart';
class ListCard extends StatelessWidget {
  Map data;
  ListCard(Map data){
    this.data=data;
  }
  @override
  Widget build(BuildContext context) {
    return Container(child: 
      Card(
              child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: 
            Column(
              children: <Widget>[
                CircleAvatar(
                       backgroundImage: NetworkImage(data['img']),
                       radius: 60,
                       ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(data['title'],
                  style: TextStyle(fontWeight: FontWeight.bold)),
                ),

              ],
            )
            ),
          ),  splashColor: Colors.deepOrangeAccent,
          onTap: (){
            Navigator.pushReplacementNamed(context, '/loadSongs', arguments: {'playId':data['id'],'title':data['title']});
          },
      ),

          ),
        
        
    );
  }
}