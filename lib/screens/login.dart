import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../globals/colors.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: whiteColor,
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              ClipPath(
                clipper: WaveClipperTwo(flip: true),
                child: Container(
                  height: 420,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        darkPinkColor,
                        lightPinkColor,
                      ], // Gradient from https://learnui.design/tools/gradient-generator.html
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child: Center(
                      child: Image.asset(
                    'assets/images/boys.png',
                    width: 330,
                  )),
                ),
              ),
              Container(
                width: 250,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                    ),
                    hintText: 'Email Address',
                    hintStyle: TextStyle(fontSize: 14.0, color: darkPinkColor),
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
                      borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 14.0, color: darkPinkColor),
                    //contentPadding: EdgeInsets.all(30.0),
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forget password?',
                      style: TextStyle(fontSize: 12.0, color: darkPinkColor),
                    )
                  ],
                ),
              ),
              Container(
                width: 240,
                margin: const EdgeInsets.symmetric(vertical: 35),
                padding: const EdgeInsets.symmetric(vertical: 1),
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(30.0),
                    border: Border.all(color: warningColor)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                      color: warningColor,
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
                      primary: darkPinkColor,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  onTap: () {
                    print('Text Clicked');
                  },
                  child: Text(
                    'No account? Create a new one!',
                    style: TextStyle(
                      letterSpacing: 0.1,
                      color: darkPinkColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
