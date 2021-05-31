import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  final String pin;
  final String date;

  const Details({Key key, this.pin, this.date}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String centre1 = '';
  String centre2 = '';

  int len;

  int dose1;
  int dose2;

  void setDose(int index) {
    dose1 = json['sessions'][index]['available_capacity_dose1'];
    dose2 = json['sessions'][index]['available_capacity_dose2'];
  }

  String display = 'Found';

  var json;

  getDetails() async {
    http.Response response = await http.get(Uri.parse(
        'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=' +
            widget.pin +
            '&date=' +
            widget.date));

    json = jsonDecode(response.body);
    len = json['sessions'].length;
    //dose1 = json['sessions'][index]['available_capacity_dose1']
    //print(json);
    print(widget.date);

    // if (json == null) {
    //   display = 'No Vaccines available here.';
    // }

    // print(display);

    //centre1 = json['sessions'][0]['name'];
    //centre2 = json[1]['name'];
    // print(list.length);
    // print(centre1);
    // print(centre2);
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getDetails();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine Availability'),
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
                  'Vaccine Not Available at this Pincode.',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ));
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              setDose(index);
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.red,
                    width: 5,
                  )),
                  padding: EdgeInsets.all(10),
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Center_id: ' +
                                (json['sessions'][index]['center_id'])
                                    .toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Center Name: ' + json['sessions'][index]['name'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Address: ' + json['sessions'][index]['address'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'From: ' + json['sessions'][index]['from'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'To: ' + json['sessions'][index]['to'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Fee Type: ' + json['sessions'][index]['fee_type'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: dose2 == 0 ? Colors.red : Colors.green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            //color: dose1 == 0 ? Colors.red : Colors.green,
                            child: Text(
                              'Available Capacity for dose 1: ' +
                                  (json['sessions'][index]
                                          ['available_capacity_dose1'])
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: dose2 == 0 ? Colors.red : Colors.green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Available Capacity for dose 2: ' +
                                  (json['sessions'][index]
                                          ['available_capacity_dose2'])
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Fee: ' + json['sessions'][index]['fee'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Minimum Age Limit: ' +
                                (json['sessions'][index]['min_age_limit'])
                                    .toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Vaccine Name: ' +
                                  json['sessions'][index]['vaccine'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        //Text(json['sessions'][index]['name']),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: json['sessions'].length,
          );
        },
        future: getDetails(),
      ),
    );
  }
}
