import 'dart:convert';

import 'package:covidapp/statedata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Certificate extends StatefulWidget {
  Certificate({Key key}) : super(key: key);

  @override
  _CertificateState createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  // final _formKey2 = GlobalKey<FormState>();

  final String url = 'https://api.rootnet.in/covid19-in/stats/latest';
  int len;

  List<String> list = [];

  bool okay = false;

  var json;
  getData() async {
    http.Response response = await http.get(Uri.parse(url));
    json = jsonDecode(response.body);

    len = json['data']['regional'].length;

    for (int i = 0; i < len; i++) {
      list.add(json['data']['regional'][i]['loc']);
    }

    setState(() {});
    okay = true;

    print(list);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  String chosenValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State-Wise Data'),
        backgroundColor: Colors.red,
      ),
      body: (list.isEmpty)
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.red,
            ))
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3 - 150,
                  ),
                  // Container(
                  //   color: Colors.yellow,
                  //   padding: EdgeInsets.all(8),
                  //   child: Text(
                  //     'NOTE: Names of States are Case sensitive',
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.bold),
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  Container(
                    height: 300,
                    width: 300,
                    child: Image.asset(
                      'assets/images/nurse1.png',
                      //height: double.infinity,
                      //width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Padding(
                  //     padding: const EdgeInsets.only(
                  //         top: 16, left: 30, right: 30, bottom: 15),

                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 8, right: 8, bottom: 20),
                    child: Container(
                      width: double.infinity,
                      child: Center(
                        child: DropdownButton<String>(
                          value: chosenValue,
                          items: list.map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                value: value);
                          }).toList(),
                          hint: Text('Choose State'),
                          onChanged: (value) {
                            setState(() {
                              chosenValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.red)))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StateData(chosenValue)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Get Data',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
