import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  final String text;

  AppBarText({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24.0,
      ),
    );
  }
}
