import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../globals/colors.dart';
import "./register.dart";
import 'dart:convert' as convert;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../providers/auth.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';
import '../widgets/showDialog.dart';

void main() {
  runApp(Login());
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> inputHandler() async {
    if (emailController.text.length == 0 ||
        passwordController.text.length == 0) {
      return ShowDialog(context, 'Login Error', 'You must fill the all areas!');
    }

    try {
      var values = {
        "Email": emailController.text,
        "Password": passwordController.text
      };
      var url = Uri.parse(
          'https://cb82-94-121-163-175.eu.ngrok.io/api/Account/login');
      var response = await http.post(url,
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
          },
          body: convert.jsonEncode(values));
      print(response.statusCode);
      if (response.statusCode == 200) {
        Provider.of<Auth>(context, listen: false)
            .setToken(convert.jsonDecode(response.body)['token']);
        Navigator.pushNamed(context, '/profile');
      } else if (response.statusCode == 400) {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Login Error'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Email or password wrong!'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (err) {
      print("Uncaught error: $err");
    }
  }

  @override
  void initState() {
    super.initState();

    _prefs.then((SharedPreferences prefs) {
      if (prefs.getString('token') != null) {
        prefs.remove('token');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      inputHandler();
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Email or password wrong!'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      //resizeToAvoidBottomPadding:false,
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            //mainAxisSize: MainAxisSize.max,
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
                margin: EdgeInsets.only(top: 35),
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
                  controller: emailController,
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 15),
                child: TextField(
                  obscureText: true,
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
                    // Here is key idea
                  ),
                  /*decoration: InputDecoration(
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
                  ),*/
                  controller: passwordController,
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
                margin: const EdgeInsets.only(top: 40.0),
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: inputHandler /* _showMyDialog*/,
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
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
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
