import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final CollectionReference usersCollection = Firestore.instance.collection('users');
  final String uid;
  DatabaseService({this.uid});
  Future getChannels() async{
   DocumentReference docrefer= usersCollection.document(uid);
   DocumentSnapshot snapshot= await docrefer.get();
   if(!snapshot.exists){
     updateUserChannel(['UCPVhZsC2od1xjGhgEc2NEPQ']);
   }else{
     Map dataFetched= snapshot.data;
     print(dataFetched['channels']);
     return dataFetched['channels'];
   }
  }
  //update channels
  Future updateUserChannel(List upChannel) async{
  return await usersCollection.document(uid).setData({
    'channels':upChannel
  }, merge: true);
  }
  //newuser
  Future createUserData(String name) async{
    return await usersCollection.document(uid).setData({
    'channels':['UCPVhZsC2od1xjGhgEc2NEPQ'],
    'name':name,
    'playlists':['noplaylist'],
    
  });
  }
}