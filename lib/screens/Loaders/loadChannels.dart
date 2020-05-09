import 'package:Amuzic/firebase/user.dart';
import 'package:Amuzic/firebase/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:Amuzic/validations/validate.dart';
class LoadChannels extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<User>(context);
    return Scaffold(
        body: LoadChannelsLoader(uid: user.uid,),
        backgroundColor: Colors.white,        
      );
  }
}
class LoadChannelsLoader extends StatefulWidget {
  final String uid;
  LoadChannelsLoader({this.uid});
  @override
  _LoadChannelsLoaderState createState() => _LoadChannelsLoaderState();
}

class _LoadChannelsLoaderState extends State<LoadChannelsLoader> {
  List dataList=[];
  String passtt='foo';
  ValidatorYT validatorYT=ValidatorYT();

  getDataBase(DatabaseService db) async{
  List cList= await db.getChannels();
  getAll(cList);
  //Navigator.pushReplacementNamed(context, '/myChannels', arguments: {'dataArray':channelObj});
  return ;
  }
  getAll(List cList) async{
    List<Future> dataSending;    
    dataSending= cList.map((f){return validatorYT.validateChannel(f);}).toList();
    List sent =await Future.wait(dataSending);
    //print('doennnnn');
  Navigator.pushReplacementNamed(context, '/myChannels', arguments: {'dataArray':sent});
  
  }
  @override
  Widget build(BuildContext context) {   
  final DatabaseService db= DatabaseService(uid: widget.uid);
  getDataBase(db);  
    //String id=map['playId'];
    //getData();
    return Container(
      child: Center(
        child:
        SpinKitWave(
                 color: Colors.deepOrangeAccent,
                 size: 50.0,
            )
        ),
    );
  }
}