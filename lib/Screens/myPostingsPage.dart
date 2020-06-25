import 'package:crib_hunter/Models/appConstants.dart';
import 'package:crib_hunter/Models/postingObjects.dart';
import 'package:crib_hunter/Screens/createPostingPage.dart';
import 'package:crib_hunter/Views/listWidgets.dart';
import 'package:flutter/material.dart';

class MyPostingsPage extends StatefulWidget {
  MyPostingsPage({Key key}) : super(key: key);

  @override
  _MyPostingsPageState createState() => _MyPostingsPageState();
}

class _MyPostingsPageState extends State<MyPostingsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: ListView.builder(
        itemCount: AppConstants.currentUser.myPostings.length + 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: InkResponse(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreatePostingPage(
                      posting:
                          (index == AppConstants.currentUser.myPostings.length)
                              ? null
                              : AppConstants.currentUser.myPostings[index],
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: index == AppConstants.currentUser.myPostings.length
                    ? CreatePostingListTile()
                    : MyPostingListTile(
                        posting: AppConstants.currentUser.myPostings[index],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
