import 'package:flutter/material.dart';
import './screens/login.dart';
import './screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void onPressed() {
    print('working');
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: new Scaffold(resizeToAvoidBottomInset: false, body: Register()));
  }
}
