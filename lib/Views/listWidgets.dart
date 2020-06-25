import 'package:auto_size_text/auto_size_text.dart';
import 'package:crib_hunter/Models/appConstants.dart';
import 'package:crib_hunter/Models/messagingObjects.dart';
import 'package:crib_hunter/Models/postingObjects.dart';
import 'package:crib_hunter/Models/reviewObjects.dart';
import 'package:crib_hunter/Screens/viewProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ReviewListTile extends StatefulWidget {
  final Review review;

  ReviewListTile({this.review, Key key}) : super(key: key);

  @override
  _ReviewListTileState createState() => _ReviewListTileState();
}

class _ReviewListTileState extends State<ReviewListTile> {
  Review _review;

  @override
  void initState() {
    this._review = widget.review;
    this._review.contact.getImageFromStorage().whenComplete(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            InkResponse(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewProfilePage(
                      contact: _review.contact,
                    ),
                  ),
                );
              },
              child: Container(
                child: (_review.contact.displayImage == null)
                    ? Container(
                        width: MediaQuery.of(context).size.width / 7.5,
                      )
                    : CircleAvatar(
                        backgroundImage: _review.contact.displayImage,
                        radius: MediaQuery.of(context).size.width / 15,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: AutoSizeText(
                _review.contact.firstName,
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
              rating: _review.rating,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
          child: AutoSizeText(
            _review.text,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}

class ConversationListTile extends StatefulWidget {
  final Conversation conversation;

  ConversationListTile({this.conversation, Key key}) : super(key: key);

  @override
  _ConversationListTileState createState() => _ConversationListTileState();
}

class _ConversationListTileState extends State<ConversationListTile> {
  Conversation _conversation;

  @override
  void initState() {
    this._conversation = widget.conversation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ViewProfilePage(contact: _conversation.otherContact),
            ),
          );
        },
        child: CircleAvatar(
          backgroundImage: _conversation.otherContact.displayImage,
          radius: MediaQuery.of(context).size.width / 14.0,
        ),
      ),
      title: Text(
        _conversation.otherContact.getFullName(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      subtitle: AutoSizeText(
        _conversation.getLastMessageText(),
        minFontSize: 16,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        _conversation.getLastMessageDateTime(),
        style: TextStyle(
          fontSize: 13.0,
        ),
      ),
      contentPadding: EdgeInsets.all(15.0),
    );
  }
}

class MessageListTile extends StatelessWidget {
  final Message message;

  MessageListTile({this.message, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message.sender.firstName == AppConstants.currentUser.firstName) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(35, 15, 15, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          message.text,
                          textWidthBasis: TextWidthBasis.parent,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          message.getMessageDateTime(),
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewProfilePage(
                        contact:
                            AppConstants.currentUser.createContactFromUser()),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage: AppConstants.currentUser.displayImage,
                radius: MediaQuery.of(context).size.width / 20,
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 35, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ViewProfilePage(contact: message.sender),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage: message.sender.displayImage,
                radius: MediaQuery.of(context).size.width / 20,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          message.text,
                          textWidthBasis: TextWidthBasis.parent,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          message.getMessageDateTime(),
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}

class MyPostingListTile extends StatefulWidget {
  final Posting posting;

  MyPostingListTile({this.posting, Key key}) : super(key: key);

  @override
  _MyPostingListTileState createState() => _MyPostingListTileState();
}

class _MyPostingListTileState extends State<MyPostingListTile> {
  Posting _posting;

  @override
  void initState() {
    this._posting = widget.posting;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(15.0),
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: AutoSizeText(
          _posting.name,
          maxLines: 2,
          minFontSize: 20.0,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      trailing: AspectRatio(
        aspectRatio: 3 / 2,
        child: Image(
          image: _posting.displayImages.first,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class CreatePostingListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.add),
          ),
          Text(
            'Create a posting',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
