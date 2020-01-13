import 'package:crib_hunter/Screens/viewProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'loginPage.dart';
import 'personalInfoPage.dart';

import 'package:crib_hunter/Models/appConstants.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _logout() {
    Navigator.pushNamed(context, LoginPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ViewProfilePage.routeName);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: MediaQuery.of(context).size.width / 10.5,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile3.png'),
                      radius: MediaQuery.of(context).size.width / 10.8,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        'John Doe',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      AutoSizeText(
                        'supergenericapps@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              MaterialButton(
                height: MediaQuery.of(context).size.height / 11.0,
                onPressed: () {
                  Navigator.pushNamed(context, PersonalInfoPage.routeName);
                },
                child: ProfilePageListTile(
                  text: 'Personal Information',
                  iconData: Icons.person,
                ),
              ),
              MaterialButton(
                height: MediaQuery.of(context).size.height / 11.0,
                onPressed: () {},
                child: ProfilePageListTile(
                  text: 'Become a Host',
                  iconData: Icons.hotel,
                ),
              ),
              MaterialButton(
                height: MediaQuery.of(context).size.height / 11.0,
                onPressed: _logout,
                child: ProfilePageListTile(
                  text: 'Logout',
                  iconData: null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfilePageListTile extends StatelessWidget {
  final String text;
  final IconData iconData;

  ProfilePageListTile({Key key, this.text, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      contentPadding: EdgeInsets.all(0.0),
      leading: Text(
        this.text,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.normal,
        ),
      ),
      trailing: Icon(
        this.iconData,
        size: 30.0,
      ),
    );
  }
}
