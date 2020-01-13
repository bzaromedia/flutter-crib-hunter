import 'package:auto_size_text/auto_size_text.dart';
import 'package:crib_hunter/Models/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ReviewListTile extends StatefulWidget {
  ReviewListTile({Key key}) : super(key: key);

  @override
  _ReviewListTileState createState() => _ReviewListTileState();
}

class _ReviewListTileState extends State<ReviewListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/default-user.jpg'),
              radius: MediaQuery.of(context).size.width / 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: AutoSizeText(
                'Nutz',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19.0,
                ),
              ),
            ),
            StarRating(
              size: 23.0,
              starCount: 5,
              color: AppConstants.selectedIconColor,
              borderColor: Colors.grey,
              onRatingChanged: null,
              rating: 4.5,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
          child: AutoSizeText(
            'Great guy, really enjoyed his stay at this place, would recommend him to other people',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
