import 'package:auto_size_text/auto_size_text.dart';
import 'package:crib_hunter/Models/appConstants.dart';
import 'package:crib_hunter/Models/postingObjects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class PostingGridTile extends StatefulWidget {
  final Posting posting;

  PostingGridTile({this.posting, Key key}) : super(key: key);

  @override
  _PostingGridTileState createState() => _PostingGridTileState();
}

class _PostingGridTileState extends State<PostingGridTile> {
  Posting _posting;

  @override
  void initState() {
    this._posting = widget.posting;
    super.initState();
  }

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
                image: this._posting.displayImages.first,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        AutoSizeText(
          "${_posting.type} - ${_posting.city}, ${_posting.country}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        AutoSizeText(
          _posting.name,
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
        Text('\$${_posting.price} / night'),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            StarRating(
              size: 18.0,
              starCount: 5,
              color: AppConstants.selectedIconColor,
              borderColor: Colors.grey,
              onRatingChanged: null,
              rating: _posting.getCurrentRating(),
            ),
          ],
        ),
      ],
    );
  }
}

class TripGridTile extends StatefulWidget {
  final Booking booking;

  TripGridTile({this.booking, Key key}) : super(key: key);

  @override
  _TripGridTileState createState() => _TripGridTileState();
}

class _TripGridTileState extends State<TripGridTile> {
  Booking _booking;

  @override
  void initState() {
    this._booking = widget.booking;
    super.initState();
  }

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
                image: _booking.posting.displayImages.first,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        AutoSizeText(
          _booking.posting.name,
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        AutoSizeText(
          '${_booking.posting.city} ${_booking.posting.country}',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        Text('\$${_booking.posting.price} / night'),
        Text(
          '${_booking.getFirstDate()} -',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${_booking.getLastDate()}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
