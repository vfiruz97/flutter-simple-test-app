import 'package:flutter/material.dart';
import 'package:test_task/lang/ru.dart';
import 'package:test_task/env.dart';
import 'package:test_task/screens/pages/second_screen.dart';
import 'package:test_task/styles/style.dart';
import 'package:test_task/validates/screen_first_validate.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool _showSecondScreen = false;
  final _formKey = GlobalKey<FormState>();
  String _url = '';
  int _number = 3;

  @override
  Widget build(BuildContext context) {
    return _showSecondScreen
        ? SecondScreen(
            url: _url,
            number: _number,
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(APP_NAME),
              centerTitle: true,
              elevation: 0.0,
            ),
            body: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 8.0,
              ),
              padding: EdgeInsets.all(18.0),
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  TextFormField(
                    initialValue: _url,
                    autofocus: true,
                    keyboardType: TextInputType.url,
                    decoration: inputDecoration(labelText: urlLabel),
                    onChanged: (value) => setState(() {
                      _url = value;
                    }),
                    validator: (value) => urlValide(value),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    initialValue: _number.toString(),
                    keyboardType: TextInputType.number,
                    decoration: inputDecoration(labelText: numLabel),
                    onChanged: (value) => setState(() {
                      _number = int.parse(value);
                    }),
                    validator: (value) => numberValide(value),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          _showSecondScreen = true;
                        });
                      }
                    },
                    child: Text(submit),
                  ),
                ]),
              ),
            ),
          );
  }
}
