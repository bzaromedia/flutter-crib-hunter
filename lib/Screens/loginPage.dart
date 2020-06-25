import 'package:crib_hunter/Models/userObjects.dart';
import 'package:crib_hunter/Screens/guestHomePage.dart';
import 'package:crib_hunter/Screens/signUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crib_hunter/Models/appConstants.dart';

class LoginPage extends StatefulWidget {
  static final String routeName = '/loginPageRoute';

  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _signUp() {
    Navigator.pushNamed(context, SignUpPage.routeName);
  }

  void _login() {
    if (_formKey.currentState.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((currentUser) {
        String userID = currentUser.user.uid;
        AppConstants.currentUser = User(id: userID);
        AppConstants.currentUser.getUserInfoFromFirestore().whenComplete(() {
          AppConstants.currentUser.getImageFromStorage().whenComplete(() {
            Navigator.pushNamed(context, GuestHomePage.routeName);
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 100, 25, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome to ${AppConstants.appName}!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
                textAlign: TextAlign.center,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 35.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                        validator: (text) {
                          if (!text.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        controller: _emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                        obscureText: true,
                        validator: (text) {
                          if (text.length < 6) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                        controller: _passwordController,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: MaterialButton(
                  onPressed: () {
                    _login();
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                  height: MediaQuery.of(context).size.height / 14,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: MaterialButton(
                  onPressed: () {
                    _signUp();
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.red,
                  height: MediaQuery.of(context).size.height / 12,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
