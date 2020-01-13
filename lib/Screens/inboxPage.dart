import 'package:flutter/material.dart';
import 'package:crib_hunter/Models/appConstants.dart';

class InboxPage extends StatefulWidget {
  InboxPage({Key key}) : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Inbox Page'),
    );
  }
}
