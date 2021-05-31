import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StateData extends StatefulWidget {
  final String state;

  StateData(this.state);

  @override
  _StateDataState createState() => _StateDataState();
}

class _StateDataState extends State<StateData> {
  final String url = 'https://api.rootnet.in/covid19-in/stats/latest';

  String name;
  String confirmedCases;
  String recoverd;
  String deaths;

  bool loaded = false;
  int len;

  getData() async {
    http.Response response = await http.get(Uri.parse(url));
    loaded = true;

    var json = jsonDecode(response.body);

    len = json['data']['regional'].length;

    for (int i = 0; i < len; i++) {
      if (json['data']['regional'][i]['loc'] == widget.state) {
        confirmedCases =
            (json['data']['regional'][i]['confirmedCasesIndian']).toString();
        recoverd = (json['data']['regional'][i]['discharged']).toString();
        deaths = (json['data']['regional'][i]['deaths']).toString();
      }
    }

    name = widget.state;

    print(name);
    print(confirmedCases);
    print(recoverd);
    print(deaths);

    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Data (${widget.state})'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: (loaded == false)
            ? Center(child: CircularProgressIndicator(color: Colors.red))
            : (confirmedCases == null)
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'State not found, re-check your input for errors',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 3 - 50,
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.red),
                          // ),

                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'State: $name',
                                    style: TextStyle(
                                      //color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.yellow,
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Confirmed Cases: $confirmedCases',
                                      style: TextStyle(
                                        //color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    color: Colors.green,
                                    child: Text(
                                      'Total Recovered: $recoverd',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 8, right: 8, bottom: 0),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    color: Colors.red,
                                    child: Text(
                                      'Total Deaths: $deaths',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Image.asset('assets/images/cat.png'),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}
