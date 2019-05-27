import 'package:flutter/material.dart';
import 'package:hackathon/Login/sign_in.dart';
import 'package:hackathon/Login/sign_up.dart';

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
          RaisedButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: navigateToSignIn,
            child: Text('Sign in'),
          ),
          RaisedButton(
            textColor: Colors.white,
            color: Colors.red,
            padding: const EdgeInsets.all(8.0),
            onPressed: navigateToSignUp,
            child: Text('Sign up'),
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