import 'package:crib_hunter/Views/formWidgets.dart';

import 'guestHomePage.dart';
import 'package:crib_hunter/Views/textWidgets.dart';
import 'package:flutter/material.dart';
import 'package:crib_hunter/Models/appConstants.dart';

class ViewPostingPage extends StatefulWidget {
  static final String routeName = '/viewPostingPageRoute';

  ViewPostingPage({Key key}) : super(key: key);

  @override
  _ViewPostingPageState createState() => _ViewPostingPageState();
}

class _ViewPostingPageState extends State<ViewPostingPage> {
  void _signUp() {
    Navigator.pushNamed(context, GuestHomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(text: 'Posting Information'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(),
            Row(),
            Row(),
            //      ListView(),
            Text(''),
            Text('Amenities'),
            //          GridView.count(crossAxisCount: null)
            Text('The Location'),
            Container(),
            Text('Reviews'),
            ReviewForm(),
            //        ListView.builder(itemBuilder: null),
          ],
        ),
      ),
    );
  }
}
