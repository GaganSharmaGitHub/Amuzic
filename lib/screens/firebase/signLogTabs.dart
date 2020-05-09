import 'package:Amuzic/components/signInForm.dart';
import 'package:Amuzic/components/signUpForm.dart';
import 'package:flutter/material.dart';

class SignLogScreen extends StatelessWidget {
  const SignLogScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text('Get started'),
          bottom: TabBar(
            tabs: <Widget>[Text('Log In'), Text('Sign Up')],
            labelColor: Colors.white,
          ),
          centerTitle: true,
          titleSpacing: 0,
        ),
        body: TabBarView(
          children: <Widget>[
            Container(child: LoginForm()),
            Container(
              child: SignUpForm(),
            )
          ],
        ),
      ),
      length: 2,
    );
  }
}
