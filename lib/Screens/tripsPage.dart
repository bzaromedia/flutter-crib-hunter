import 'package:crib_hunter/Screens/viewPostingPage.dart';
import 'package:crib_hunter/Views/gridWidgets.dart';
import 'package:flutter/material.dart';
import 'package:crib_hunter/Models/appConstants.dart';

class TripsPage extends StatefulWidget {
  TripsPage({Key key}) : super(key: key);

  @override
  _TripsPageState createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                'Upcoming Trips',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 25.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: InkResponse(
                          enableFeedback: true,
                          child: TripGridTile(),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ViewPostingPage.routeName,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Text(
              'Previous Trips',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 25.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: InkResponse(
                          enableFeedback: true,
                          child: TripGridTile(),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ViewPostingPage.routeName,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
