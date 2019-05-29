import 'package:flutter/material.dart';
import 'package:hackathon/Login/sign_in.dart';
import 'package:hackathon/Login/sign_up.dart';

import '../button.dart';

class Login extends StatefulWidget {
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My firebase app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
                'assets/images/fLogo.png',width: 250,
                height:  250,),
          SimpleRoundButton(
            textColor: Colors.white,
            backgroundColor: Colors.lightGreen,
            onPressed: navigateToSignIn,
            buttonText: Text('Sign in'),
          ),
          SimpleRoundButton(
            textColor: Colors.white,
            backgroundColor: Colors.orangeAccent,
            onPressed: navigateToSignUp,
            buttonText: Text('Sign up'),
          ),
        ],
      ),
    );
  }

  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}