import 'package:flutter/material.dart';

void main() {
  runApp(Register());
}

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            Color.fromRGBO(255, 41, 79, 1),
            Color.fromRGBO(244, 118, 130, 1),
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5),
                ),
                hintText: 'Username',
                hintStyle: TextStyle(fontSize: 14.0, color: Colors.white),
                //contentPadding: EdgeInsets.all(30.0),
              ),
            ),
          ),
          Container(
            width: 250,
            margin: EdgeInsets.only(top: 15),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5),
                ),
                hintText: 'Name',
                hintStyle: TextStyle(fontSize: 14.0, color: Colors.white),
                //contentPadding: EdgeInsets.all(30.0),
              ),
            ),
          ),
          Container(
            width: 250,
            margin: EdgeInsets.only(top: 15),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5),
                ),
                hintText: 'Surname',
                hintStyle: TextStyle(fontSize: 14.0, color: Colors.white),
                //contentPadding: EdgeInsets.all(30.0),
              ),
            ),
          ),
          Container(
            width: 250,
            margin: EdgeInsets.only(top: 15),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5),
                ),
                hintText: 'Date of birth',
                hintStyle: TextStyle(fontSize: 14.0, color: Colors.white),
                //contentPadding: EdgeInsets.all(30.0),
              ),
            ),
          ),
          Container(
            width: 250,
            margin: EdgeInsets.only(top: 15),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5),
                ),
                hintText: 'Email Address',
                hintStyle: TextStyle(fontSize: 14.0, color: Colors.white),
                //contentPadding: EdgeInsets.all(30.0),
              ),
            ),
          ),
          Container(
            width: 250,
            margin: EdgeInsets.only(top: 15),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(fontSize: 14.0, color: Colors.white),
                //contentPadding: EdgeInsets.all(30.0),
              ),
            ),
          ),
          Container(
            width: 250,
            margin: EdgeInsets.only(top: 15),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5),
                ),
                hintText: 'Password(again)',
                hintStyle: TextStyle(fontSize: 14.0, color: Colors.white),
                //contentPadding: EdgeInsets.all(30.0),
              ),
            ),
          ),
          Container(
            width: 240,
            margin: const EdgeInsets.symmetric(vertical: 35),
            padding: const EdgeInsets.symmetric(vertical: 1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(30.0),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 15,
                child: Image.asset(
                  'assets/images/warning.png',
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'wrong email or password',
                style: TextStyle(
                  color: Color.fromRGBO(221, 45, 45, 1),
                  fontSize: 10,
                ),
              )
            ]),
          ),
          FractionallySizedBox(
            widthFactor: 0.7,
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0.1,
                      color: Color.fromRGBO(255, 41, 79, 1)),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
