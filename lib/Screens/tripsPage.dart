import 'package:crib_hunter/Models/postingObjects.dart';
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
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                'Upcoming Trips',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 25.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: AppConstants.currentUser.getUpcomingTrips().length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Booking currentBooking =
                        AppConstants.currentUser.getUpcomingTrips()[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: InkResponse(
                          enableFeedback: true,
                          child: TripGridTile(
                            booking: currentBooking,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewPostingPage(
                                  posting: currentBooking.posting,
                                ),
                              ),
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
                width: double.infinity,
                child: ListView.builder(
                  itemCount: AppConstants.currentUser.getPreviousTrips().length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Booking currentBooking =
                        AppConstants.currentUser.getPreviousTrips()[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: InkResponse(
                          enableFeedback: true,
                          child: TripGridTile(
                            booking: currentBooking,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewPostingPage(
                                  posting: currentBooking.posting,
                                ),
                              ),
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
