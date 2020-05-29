import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final CollectionReference usersCollection = Firestore.instance.collection('users');
  final String uid;
  DatabaseService({this.uid});
  //get all channels
  Future<List> getChannels() async{
   DocumentReference docrefer= usersCollection.document(uid);
   DocumentSnapshot snapshot= await docrefer.get();
   if(!snapshot.exists){
     updateUserChannel(['UCPVhZsC2od1xjGhgEc2NEPQ']);
     return['UCPVhZsC2od1xjGhgEc2NEPQ'];
   }else{
     Map dataFetched= snapshot.data;
     List cList= dataFetched['channels'];
    Set cSet= cList.toSet();
   cList= cSet.toList();
     return cList;
   }
  }
  //remove a channel
  Future removeChannel(String cId) async{
    try{List initList = await getChannels();
   int index= initList.indexOf(cId);
   initList.removeAt(index);
    updateUserChannel(initList);
    return index;}catch(e){
      return e.message;
    }
  }
  //push a channel
  Future pushChannel(String newC) async{
    try{List initList = await getChannels();
    initList.add(newC);
    updateUserChannel(initList);
    return initList;
    }catch(e){
      return e.message;
    }
  }
  //update channels
  Future updateUserChannel(List upChannel) async{
    Set upSet= upChannel.toSet();
    upChannel=upSet.toList();
  return await usersCollection.document(uid).setData({
    'channels':upChannel
  }, merge: true);
  }
  //set name
  Future setName(String newName) async{
   return await usersCollection.document(uid).setData({
    'name':newName
  }, merge: true);
  }
  Future deleteUser() {
  try{ DocumentReference docrefer= usersCollection.document(uid);
  var del= docrefer.delete();
  return del;
  }
  catch(e){
    return null;
  }
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