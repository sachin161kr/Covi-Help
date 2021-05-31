import 'package:covidapp/details.dart';
import 'package:flutter/material.dart';
import './myDrawer.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.red),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController pin = TextEditingController();

  TextEditingController date = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        //leading: Icon(Icons.local_hospital),
        title: Text('Covid-19 Vaccine Tracker'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3 - 180,
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 0),
                //height: MediaQuery.of(context).size.height / 5 - 100,
                height: 50,
                child: Text(
                  '#LET\'S GET VACCINATED',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
              Container(
                height: 280,
                width: 350,
                child: Image.asset('assets/images/vaccination.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This Field is Mandatory';
                    } else if (value.length != 6) {
                      return 'Enter a Valid Pincode';
                    }
                    return null;
                  },
                  controller: pin,
                  decoration: InputDecoration(
                    hintText: 'Enter Area Pincode',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This Field is Mandatory';
                    } else if (value.length != 10) {
                      return 'Enter a Valid Date';
                    }

                    return null;
                  },
                  controller: date,
                  decoration: InputDecoration(
                    hintText: 'Enter Date (DD-MM-YYYY)',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.red)))),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                      pin: pin.text,
                                      date: date.text,
                                    )));
                      } else {
                        print('Not okay');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Check Availability',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
