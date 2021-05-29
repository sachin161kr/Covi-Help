import 'package:flutter/material.dart';

class Certificate extends StatefulWidget {
  Certificate({Key key}) : super(key: key);

  @override
  _CertificateState createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download Certificate'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This Field is Mandatory';
                    } else {
                      if (value.length != 10) {
                        return 'Enter Valid Mobile No.';
                      }
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Your Registered Mobile No.',
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
                _formKey1.currentState.validate();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Get OTP',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 30, right: 30, bottom: 15),
              child: Form(
                key: _formKey2,
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This Field is Mandatory';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter OTP here',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _formKey2.currentState.validate();
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Verify OTP',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.red)))),
            ),
          ],
        ),
      ),
    );
  }
}
