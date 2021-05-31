import 'package:covidapp/certificate.dart';
import 'package:covidapp/news.dart';
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
                Icons.location_city,
                color: Colors.black,
              ),
              title: Text(
                'State-Wise Data',
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
                Icons.health_and_safety,
                color: Colors.black,
              ),
              title: Text(
                'News on Health',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => News()));
              },
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
                  await launch(
                    url,
                    forceSafariVC: true,
                    forceWebView: true,
                    enableJavaScript: true,
                    headers: <String, String>{'header_key': 'header_value'},
                  );
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
                Icons.medical_services,
                color: Colors.black,
              ),
              title: Text(
                'Co-WIN Portal',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onTap: () async {
                const url = 'https://www.cowin.gov.in/home';
                if (await canLaunch(url)) {
                  await launch(
                    url,
                    // forceSafariVC: true,
                    // forceWebView: true,
                    // enableJavaScript: true,
                    // headers: <String, String>{'header_key': 'header_value'},
                  );
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
