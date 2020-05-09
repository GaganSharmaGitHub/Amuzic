import 'package:Amuzic/firebase/auth.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  final AuthServices _auth = AuthServices();
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image(
                    image: AssetImage('image/amuzicLogo.png'),
                    width: 50,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Sign Up to Amuzic ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'The amazing music app!',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Enter your Name:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Card(
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Nickname',
                    prefixIcon: Icon(Icons.account_circle),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
                maxLines: 1,
              ),
            ),
            Text(
              'Enter your Email:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Card(
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'example@email.com',
                    prefixIcon: Icon(Icons.mail_outline),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Create Password:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Card(
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                    hintText: '********',
                    prefixIcon: Icon(Icons.lock_outline),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
                maxLines: 1,

              ),
            ),
            Text(
              'Confirm Password:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Card(
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    confirmPassword = value;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                    hintText: '********',
                    prefixIcon: Icon(Icons.lock_outline),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.person_add),
                  Text('  Sign Up'),
                ],
              ),
              onPressed: () async {
                dynamic result = await widget._auth
                    .newUserCreate({'email': email, 'password': password});
                if (result == null) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Enter correct email and password')));
                }
              },
              color: Colors.deepOrangeAccent,
            ),
            Center(
                child: Text(
              'Already a Amuzic fan?',
              style: TextStyle(fontStyle: FontStyle.italic),
            )),
            Center(
                child: Text(
              'Log In to play your favourites',
              style: TextStyle(fontStyle: FontStyle.italic),
            ))
          ],
        ),
      ),
    ));
  }
}
