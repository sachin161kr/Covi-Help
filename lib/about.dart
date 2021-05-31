import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About the App'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.yellow),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'This is a complete API based application. API is the acronym for Application Programming Interface, which is a software intermediary that allows two applications to talk to each other. Each time you use an app like Facebook, send an instant message, or check the weather on your phone, you\'re using an API.',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 8, right: 8, bottom: 0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'API providers for the App : ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Vaccine Availability API: \nhttps://apisetu.gov.in/public/marketplace/api/cowin \nSourced from Offical Co-WIN website maintained by Indian Government.',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'State-Wise Data API: \nhttps://api.rootnet.in/covid19-in/stats/latest \nSourced from The Ministry of Health and Family Welfare.',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  top: 8,
                  bottom: 8,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'NEWS API: \nhttps://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=XXXXXXXXXXXXXXXXX \nSourced from newsapi.org/',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  top: 8,
                  bottom: 8,
                ),
                child: Container(
                  //width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Additional Websites Integrated : ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  top: 0,
                  bottom: 8,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Worldometer Website: \nlink - https://www.worldometers.info/coronavirus/',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  top: 0,
                  bottom: 8,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Co-WIN Website: \nlink - https://www.cowin.gov.in/home',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  top: 8,
                  bottom: 8,
                ),
                child: Container(
                  //width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.yellow),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Image Sources : ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  top: 0,
                  bottom: 8,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.yellow),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'HomePage Image: https://www.freepik.com/\nApp Icon: https://www.freepik.com/',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  top: 0,
                  bottom: 8,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.yellow),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Police: https://pngtree.com/free-png\nNurse: https://pngtree.com/free-png\nCat: https://pngtree.com/free-png',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  top: 8,
                  bottom: 8,
                ),
                child: Container(
                  //width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.purple),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Developer Contact : ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        const linkedin =
                            'https://www.linkedin.com/in/sachin-kumar-29287a68/';
                        if (await canLaunch(linkedin)) {
                          await launch(
                            linkedin,
                            // forceSafariVC: true,
                            // forceWebView: true,
                            // enableJavaScript: true,
                            // headers: <String, String>{'header_key': 'header_value'},
                          );
                        } else {
                          throw 'Could not launch $linkedin';
                        }
                      },
                      child: Container(
                          height: 62,
                          width: 62,
                          child: Image.asset('assets/images/linkedin.png')),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        launch(
                            'mailto:mail.sachin161@gmail.com?subject=Regarding Covid-19 App');
                      },
                      child: Container(
                          height: 50,
                          width: 50,
                          child: Image.asset('assets/images/gmail.png')),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
