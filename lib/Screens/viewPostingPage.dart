import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:crib_hunter/Models/postingObjects.dart';
import 'package:crib_hunter/Models/reviewObjects.dart';
import 'package:crib_hunter/Screens/bookPostingPage.dart';
import 'package:crib_hunter/Screens/viewProfilePage.dart';
import 'package:crib_hunter/Views/formWidgets.dart';
import 'package:crib_hunter/Views/listWidgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:crib_hunter/Views/textWidgets.dart';
import 'package:flutter/material.dart';

class ViewPostingPage extends StatefulWidget {
  static final String routeName = '/viewPostingPageRoute';
  final Posting posting;

  ViewPostingPage({this.posting, Key key}) : super(key: key);

  @override
  _ViewPostingPageState createState() => _ViewPostingPageState();
}

class _ViewPostingPageState extends State<ViewPostingPage> {
  Posting _posting;
  LatLng _centerLatLong = LatLng(37.7836, -122.3899);
  Completer<GoogleMapController> _completer;

  void _calculateLatAndLng() {
    _centerLatLong = LatLng(37.7836, -122.3899);
    Geolocator()
        .placemarkFromAddress(_posting.getFullAddress())
        .then((placemarks) {
      placemarks.forEach((placemark) {
        setState(() {
          _centerLatLong =
              LatLng(placemark.position.latitude, placemark.position.longitude);
        });
      });
    });
  }

  @override
  void initState() {
    this._posting = widget.posting;
    _completer = Completer();
    _calculateLatAndLng();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(text: 'Posting Information'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 3 / 2,
              child: PageView.builder(
                itemCount: _posting.displayImages.length,
                itemBuilder: (context, index) {
                  MemoryImage currentImage = _posting.displayImages[index];
                  return Image(
                    image: currentImage,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 1.75,
                            child: AutoSizeText(
                              _posting.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26.0,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          MaterialButton(
                            color: Colors.redAccent,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookPostingPage(
                                    posting: this._posting,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Book Now',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            '\$${_posting.price} / night',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 45.0,
                      bottom: 25.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.75,
                          child: AutoSizeText(
                            _posting.description,
                            style: TextStyle(),
                            minFontSize: 16.0,
                            maxFontSize: 22.0,
                            maxLines: 5,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width / 12.5,
                              backgroundColor: Colors.black,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewProfilePage(
                                        contact: _posting.host,
                                      ),
                                    ),
                                  );
                                },
                                child: CircleAvatar(
                                  backgroundImage: _posting.host.displayImage,
                                  radius:
                                      MediaQuery.of(context).size.width / 13,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7.0),
                              child: Text(
                                _posting.host.getFullName(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        PostingInfoTile(
                          iconData: Icons.home,
                          category: _posting.type,
                          categoryInfo: '${_posting.getNumGuests()} guests',
                        ),
                        PostingInfoTile(
                          iconData: Icons.hotel,
                          category: 'Beds',
                          categoryInfo: _posting.getBedroomText(),
                        ),
                        PostingInfoTile(
                          iconData: Icons.wc,
                          category: 'Bathrooms',
                          categoryInfo: _posting.getBathroomText(),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Amenities',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25.0,
                      bottom: 25.0,
                    ),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 1,
                      children: List.generate(
                        _posting.amenities.length,
                        (index) {
                          String currentAmenity = _posting.amenities[index];
                          return Text(
                            currentAmenity[index],
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    'The Location',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25.0,
                      bottom: 25.0,
                    ),
                    child: Text(
                      _posting.getFullAddress(),
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: GoogleMap(
                        onMapCreated: (controller) {
                          _completer.complete(controller);
                        },
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: _centerLatLong,
                          zoom: 14,
                        ),
                        markers: <Marker>{
                          Marker(
                            markerId: MarkerId('Home Location'),
                            position: _centerLatLong,
                            icon: BitmapDescriptor.defaultMarker,
                          ),
                        },
                      ),
                    ),
                  ),
                  Text(
                    'Reviews',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ReviewForm(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ListView.builder(
                      itemCount: _posting.reviews.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Review currentReview = _posting.reviews[index];
                        return Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: ReviewListTile(
                            review: currentReview,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostingInfoTile extends StatelessWidget {
  final IconData iconData;
  final String category;
  final String categoryInfo;

  PostingInfoTile({
    Key key,
    this.iconData,
    this.category,
    this.categoryInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        this.iconData,
        size: 22.0,
      ),
      title: Text(
        category,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      subtitle: Text(
        categoryInfo,
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
    );
  }
}
