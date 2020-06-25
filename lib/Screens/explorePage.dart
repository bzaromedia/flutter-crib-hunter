import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crib_hunter/Models/data.dart';
import 'package:crib_hunter/Models/postingObjects.dart';
import 'package:crib_hunter/Screens/viewPostingPage.dart';
import 'package:crib_hunter/Views/gridWidgets.dart';
import 'package:flutter/material.dart';
import 'package:crib_hunter/Models/appConstants.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({Key key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<Posting> _postings;

  @override
  void initState() {
    _postings = PracticeData.postings;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 50.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(5.0),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            StreamBuilder(
              stream: Firestore.instance.collection('postings').snapshots(),
              builder: (context, snapshots) {
                switch (snapshots.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    return GridView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _postings.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 3 / 4,
                      ),
                      itemBuilder: (context, index) {
                        Posting currentPosting = _postings[index];
                        return InkResponse(
                          enableFeedback: true,
                          child: PostingGridTile(
                            posting: currentPosting,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewPostingPage(
                                  posting: currentPosting,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
