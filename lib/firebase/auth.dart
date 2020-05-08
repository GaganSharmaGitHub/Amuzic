import 'package:Amuzic/firebase/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Amuzic/firebase/user.dart';
class AuthServices {
  final FirebaseAuth _auth= FirebaseAuth.instance;
 
 User _getUser(FirebaseUser user){
  return user==null?null:User(uid: user.uid);
 }
 Stream<User> get user{
   return _auth.onAuthStateChanged
   .map(_getUser);
 }
 Future signOut() async{
   try{
     return _auth.signOut();
   }catch(e){
    return null;
   }
 }

  
  Future signInEmailPass(Map empass) async{
    try{
  AuthResult result= await _auth.signInWithEmailAndPassword(
     email: empass['email'],
     password: empass['password']
     );
     FirebaseUser user = result.user;
      return _getUser(user);  
    }catch(e){
      return null;
    }
  }
 Future newUserCreate(Map empass) async{
   try{
   AuthResult result = await _auth.createUserWithEmailAndPassword(
     email: empass['email'],
     password: empass['password']);
     FirebaseUser user= result.user;
     User myUser=_getUser(user);
     await DatabaseService(uid: myUser.uid).createUserData(empass['email']);
     return myUser;
   }catch(e){
    return null;
   }
 } 

}