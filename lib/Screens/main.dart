import 'dart:async';

import 'package:crib_hunter/Screens/conversationPage.dart';
import 'package:crib_hunter/Screens/createPostingPage.dart';
import 'package:crib_hunter/Screens/hostHomePage.dart';

import 'bookPostingPage.dart';
import 'personalInfoPage.dart';
import 'package:flutter/material.dart';
import 'package:crib_hunter/Models/appConstants.dart';

import 'guestHomePage.dart';
import 'loginPage.dart';
import 'signUpPage.dart';
import 'viewProfilePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
        GuestHomePage.routeName: (context) => GuestHomePage(),
        PersonalInfoPage.routeName: (context) => PersonalInfoPage(),
        ViewProfilePage.routeName: (context) => ViewProfilePage(),
        BookPostingPage.routeName: (context) => BookPostingPage(),
        ConversationPage.routeName: (context) => ConversationPage(),
        HostHomePage.routeName: (context) => HostHomePage(),
        CreatePostingPage.routeName: (context) => CreatePostingPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, LoginPage.routeName);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.hotel,
              size: 80.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                '${AppConstants.appName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
