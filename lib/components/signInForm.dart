import 'package:Amuzic/firebase/auth.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final AuthServices _auth= AuthServices();
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
                child: ListView(
            children: <Widget>[
              Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(image: AssetImage('image/amuzicLogo.png'),
                width: 50,),
                Column(
                    children: <Widget>[
                      Text('Login to Amuzic '),
                      Text('the amazing music app',
                      maxLines: 2,),
                    ],
                ),
              ],
            ),
                  ),
              Text('Enter Email:'),
              TextFormField(
                onChanged: (value){
                  setState(() {
                    email=value;
                  });
                },
                decoration:   InputDecoration(
                  hintText: 'example@email.com',
                  prefixIcon: Icon(Icons.mail_outline),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrangeAccent
                    )
                  )
                ),
                maxLines: 1,
              ),
              SizedBox(height: 10,),
              Text('Enter Password:'),
              TextFormField(
                onChanged: (value){
                  setState(() {
                    password=value;
                  });
                },
                obscureText: true,
                decoration:   InputDecoration(
                  hintText: '********',
                  prefixIcon: Icon(Icons.lock_outline),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrangeAccent
                    )
                  )
                ),
                maxLines: 1,
                ),
              SizedBox(height: 10,),
             FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.account_circle),
              Text('Log In'),

            ],
          ),
          onPressed: () async{
        dynamic result= await widget._auth.signInEmailPass({'email':email,'password':password});
        if(result==null){
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('Enter correct email and password')
            )
          );
         }
        },
        color: Colors.deepOrangeAccent,
        ),
        Center(child: Text('not a user yet?')),
         Center(child: Text('sign up now to create a new account'))
            ],
            
          ),
        ),
      )
    );
  }
}