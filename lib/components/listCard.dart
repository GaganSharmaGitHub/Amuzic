import 'package:flutter/material.dart';
class ListCard extends StatelessWidget {
  Map data;
  ListCard(Map data){
    this.data=data;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: 
      Card(
        elevation: 10,
              child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: 
            Column(
              children: <Widget>[
                 ClipOval(
                   
                   child: Container(
                     child: FadeInImage.assetNetwork(
                         placeholder: 'image/amuzicLogo.png',
                         image: data['img'],
                        ),
                   width: 120,
                   height: 120,
                   color: Colors.deepOrangeAccent,
                   )
                   ),       
                       
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(data['title'],
                 // textWidthBasis: TextWidthBasis.parent,
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.bold,),
                  overflow: TextOverflow.ellipsis,),
                ),
              ],
            )
            ),
          ),
          splashColor: Colors.deepOrangeAccent,
          onTap: (){
            Navigator.pushNamed(context, '/loadSongs', arguments: {'playId':data['id'],'title':data['title']});
          },
        ),
      ),
    );
  }
}