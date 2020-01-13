import 'package:auto_size_text/auto_size_text.dart';
import 'package:crib_hunter/Models/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class PostingGridTile extends StatefulWidget {
  PostingGridTile({Key key}) : super(key: key);

  @override
  _PostingGridTileState createState() => _PostingGridTileState();
}

class _PostingGridTileState extends State<PostingGridTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 3 / 2,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/apartment.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        AutoSizeText(
          'Apartment - South Beach, CA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
        ),
        AutoSizeText(
          'Awesome Apartment',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        Text('\$120 / night'),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            StarRating(
              size: 20.0,
              starCount: 5,
              color: AppConstants.selectedIconColor,
              borderColor: Colors.grey,
              onRatingChanged: null,
              rating: 4.5,
            ),
          ],
        ),
      ],
    );
  }
}

class TripGridTile extends StatefulWidget {
  TripGridTile({Key key}) : super(key: key);

  @override
  _TripGridTileState createState() => _TripGridTileState();
}

class _TripGridTileState extends State<TripGridTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 3 / 2,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/apartment.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        AutoSizeText(
          'Awesome Apartment',
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        AutoSizeText(
          'South Beach, CA',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        Text('\$120 / night'),
        Text(
          'August 3, 2020',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'August 14, 2020',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
