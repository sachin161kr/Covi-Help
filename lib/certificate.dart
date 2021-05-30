import 'package:covidapp/statedata.dart';
import 'package:flutter/material.dart';

class Certificate extends StatefulWidget {
  Certificate({Key key}) : super(key: key);

  @override
  _CertificateState createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  final _formKey1 = GlobalKey<FormState>();
  // final _formKey2 = GlobalKey<FormState>();
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State-Wise Data'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3 + 50,
              child: Image.asset(
                'assets/images/nurse1.png',
                //height: double.infinity,
                //width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 30, right: 30, bottom: 15),
              child: Form(
                key: _formKey1,
                child: TextFormField(
                  controller: myController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This Field is Mandatory';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'State Name (eg - Jharkhand)',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.red)))),
              onPressed: () {
                if (_formKey1.currentState.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StateData(myController.text)));
                }
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
