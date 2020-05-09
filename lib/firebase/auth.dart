import 'package:Amuzic/firebase/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Amuzic/firebase/user.dart';
class AuthServices {
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final Map _errorMessage={
    'There is no user record corresponding to this identifier. The user may have been deleted.':'Account not registered yet SignUp now',
    'The email address is badly formatted.':'Enter correct email',
    'The password is invalid or the user does not have a password.':'Incorrect password',
    'Given String is empty or null':'Enter correct values',
    'password is invalid. [ Password should be at least 6 characters ]':'Enter password of at least 6 characters',
    'The email address is already in use by another account.':'email already registered on amuzic, login to access your favourites'

  };

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
 //SIGN IN
  Future signInEmailPass(Map empass) async{
    try{
  AuthResult result= await _auth.signInWithEmailAndPassword(
     email: empass['email'],
     password: empass['password']
     );
     FirebaseUser user = result.user;
      return _getUser(user);  
    }catch(e){
      print(e.message);

      return e.message;
    }
  }
  Future forgotPassword(String email) async{
  try{var res=await _auth.sendPasswordResetEmail(email: email);}
  catch(e){
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
     await DatabaseService(uid: myUser.uid).createUserData(empass['name']);
     return myUser;
   }catch( e){
      print(e.message);
  
   return _errorMessage[e.message];
   }
  } 
}