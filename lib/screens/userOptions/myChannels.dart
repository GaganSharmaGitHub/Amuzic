import 'package:Amuzic/firebase/user.dart';
import 'package:Amuzic/firebase/database.dart';
import 'package:Amuzic/validations/validate.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class ChannelsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       Map map=ModalRoute.of(context).settings.arguments;
       List dataArray=map['dataArray'];
//      print(dataArray);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Icon(Icons.music_video),
            Text('My channels')
          ],
        ),
      ),
      body: ChannlesBody(initialArray: dataArray,),
    );
  }
}
class ChannlesBody extends StatefulWidget {
  final initialArray;
  ChannlesBody({this.initialArray});
  @override
  _ChannlesBodyState createState() => _ChannlesBodyState();
}

class _ChannlesBodyState extends State<ChannlesBody> {
  List channelList=new List();
  String newChannel;
  User user;
  DatabaseService db;
  ValidatorYT validatorYT=ValidatorYT();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    List fix=widget.initialArray;
    fix.forEach((f){
      channelList.add(f);
    });
        //channelList=widget.initialArray;
    user= Provider.of<User>(context);
    db= DatabaseService(uid: user.uid);

  }
  @override
  Widget build(BuildContext context) {
    return    Container(
            child: ListView.builder(itemBuilder:(context,index){
        if(index==0){
          return Form(
           child: Row(
             children: <Widget>[
               Expanded(
                 flex: 1,
                 child: Container(
                  child: TextFormField(
                onChanged: (value){
                  setState(() {
                    newChannel=value;
                  });
                },
                decoration:   InputDecoration(
                  hintText: 'enter channel id',
                ),
                maxLines: 1,
              ),
                 ),
               ),
               FlatButton(
                 child: Icon(Icons.playlist_add),
                 color: Colors.deepOrangeAccent,
                 onPressed: () async{
                 Map result=await validatorYT.validateChannel(newChannel);
                 if(result['exists']){
                   var respon= await db.pushChannel(newChannel);
                   if(respon is List){
                       List newlist=channelList;
                       newlist.add(result);
                     setState(() {
                       channelList=newlist;
                     });
                     Scaffold.of(context).showSnackBar(
                       SnackBar(content: Text('added '+result['title']))
                     );
                   }else{
                     Scaffold.of(context).showSnackBar(
                       SnackBar(content: Text(respon))
                     );
                   }
                 }else{
                     Scaffold.of(context).showSnackBar(
                       SnackBar(content: Text('incorrect ID'))
                     );
                   
                 }
                 },
               ),
             ],
           ),
          );
        }else{
        
        return Card(child: ListTile(onTap: (){
        },
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () async{
         var resp=await db.removeChannel(channelList[index-1]['id']);
         if(resp is int){
                       List newlist=channelList;
                       newlist.removeAt(resp);
                     setState(() {
                       channelList=newlist;
                     });
                     Scaffold.of(context).showSnackBar(
             SnackBar(content: Text('Removed channel from music list'))
           );  
         }else{
           Scaffold.of(context).showSnackBar(
             SnackBar(content: Text(resp))
           );
         }
          },),
        title: Text(channelList[index-1]['title']),
        leading: CircleAvatar(backgroundImage: NetworkImage(channelList[index-1]['img']
        ),),
        ),
        );
        }
      },
      itemCount: channelList.length+1),
          
      );
  }
}