import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class News extends StatefulWidget {
  News({Key key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  final String url =
      'https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=4537bc4744af4540af133918973e576c';
  int len;
  var json;

  getNews() async {
    http.Response response = await http.get(Uri.parse(url));

    json = jsonDecode(response.body);

    len = json['articles'].length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News On Health'),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (!(snapshot.connectionState == ConnectionState.done)) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              ));
            } else if (len == 0) {
              return Container(
                  padding: EdgeInsets.only(top: 250, right: 10, left: 10),
                  child: Text(
                    'Sorry! News not available at this moment. Try again later.',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ));
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    String myurl = json['articles'][index]['url'];
                    if (await canLaunch(myurl)) {
                      await launch(
                        myurl,
                        forceSafariVC: true,
                        forceWebView: true,
                        enableJavaScript: true,
                        headers: <String, String>{'header_key': 'header_value'},
                      );
                    } else {
                      throw 'Could not launch $myurl';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.red,
                        width: 4,
                      )),
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 280,
                                  width: double.infinity,
                                  child: json['articles'][index]
                                              ['urlToImage'] ==
                                          null
                                      ? Center(
                                          child: Text(
                                          'Not Available',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ))
                                      : Image.network(
                                          json['articles'][index]['urlToImage'],
                                          fit: BoxFit.cover,
                                        )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 8, bottom: 1, left: 8),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 1),
                                //color: Colors.red,
                                width: double.infinity,
                                child: json['articles'][index]['source']
                                            ['name'] ==
                                        null
                                    ? Center(
                                        child: Text(
                                        'Not Available',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                    : Text(
                                        'Source: ' +
                                            json['articles'][index]['source']
                                                ['name'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 8,
                                bottom: 1,
                                left: 8,
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                width: double.infinity,
                                child: json['articles'][index]['publishedAt'] ==
                                        null
                                    ? Center(
                                        child: Text(
                                        'Not Available',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                    : Text(
                                        'Published At: ' +
                                            json['articles'][index]
                                                ['publishedAt'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 8, bottom: 8, left: 8),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                color: Colors.yellow,
                                width: double.infinity,
                                child: json['articles'][index]['title'] == null
                                    ? Center(
                                        child: Text(
                                        'Not Available',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                    : Text(
                                        json['articles'][index]['title'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 8, bottom: 8, left: 8),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                color: Colors.green,
                                width: double.infinity,
                                child: json['articles'][index]['description'] ==
                                        null
                                    ? Center(
                                        child: Text(
                                        'Not Available',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                    : Text(
                                        json['articles'][index]['description'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: len,
            );
          },
          future: getNews(),
        ));
  }
}
