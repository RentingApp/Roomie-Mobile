import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void onPressed() {
    print('working');
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Text('Image Section'),
              Text('First Input Section'),
              Text('Second Input Section'),
              Text('Remember me Section'),
              Text('Error Message Section'),
              FractionallySizedBox(
                widthFactor: 0.7,
                child: SizedBox(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(255, 64, 83, 1),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        letterSpacing: 0.1,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Text Clicked');
                },
                child: Text(
                  'No account? Create a new one!',
                  style: TextStyle(
                      letterSpacing: 0.1,
                      color: Color.fromRGBO(255, 64, 83, 1),
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
