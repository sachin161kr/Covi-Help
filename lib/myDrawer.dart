import 'package:covidapp/certificate.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 300,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Image.asset(
                  'assets/images/police.png',
                  //height: double.infinity,
                  //width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              tileColor: Colors.red,
              leading: Icon(
                Icons.local_hospital,
                color: Colors.black,
              ),
              title: Text(
                'Covid-19 Worldometer',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onTap: () async {
                const url = 'https://www.worldometers.info/coronavirus/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              tileColor: Colors.red,
              leading: Icon(
                Icons.download,
                color: Colors.black,
              ),
              title: Text(
                'Download Vaccination Certificate (BETA)',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Certificate()));
              },
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              tileColor: Colors.red,
              leading: Icon(
                Icons.info,
                color: Colors.black,
              ),
              title: Text(
                'About the App',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
