import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathon/Login/home.dart';

// import '../feed.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
                    height: 150.0,
                    width: 150.0,
                    child: new CircleAvatar(
                      backgroundColor: Colors.transparent,
                      // foregroundColor: this.foregroundColor,
                      radius: 100.0,
                      child: new Text(
                        "   E-Kuppi",
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          // color: this.foregroundColor,
                          width: 1.0,
                        ),
                        shape: BoxShape.circle,
                        //image: DecorationImage(image: this.logo)
                      ),
                  ),
            new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    // color: Colors.white,
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.only(top: 10.0, bottom: 10.0, right: 010.0),
                  child: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                ),
                new Expanded(
                  child: TextFormField(
                   validator: (input) {
                    if(input.isEmpty){
                      return 'Provide an email';
                    }
                  },
                  // decoration: InputDecoration(
                  //   labelText: 'Email'
                  // ),
                  onSaved: (input) => _email = input,
                  ),
                ),
              ],
            ),
          ),
            new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    // color: Colors.white,
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.only(top: 10.0, bottom: 10.0, right: 010.0),
                  child: Icon(
                    Icons.lock_open,
                    color: Colors.white,
                  ),
                ),
                new Expanded(
                  child: TextFormField(
                    validator: (input) {
                      if(input.length < 6){
                        return 'Longer password please';
                      }
                    },
                    // decoration: InputDecoration(
                    //   labelText: 'Password'
                      
                    // ),
                    onSaved: (input) => _password = input,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    
                  ),
                ),
              ],
            ),
          ),
            new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    color: Colors.pink,
                    onPressed: () => signIn(),
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ],
        )
      ),
    );
  }

  void signIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Feed()));
        
      }catch(e){
        print(e.message);
      }
    }
  }
}
