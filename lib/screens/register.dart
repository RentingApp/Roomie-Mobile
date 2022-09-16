import 'package:first_app/globals/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../models/registerResponse.dart';
import '../widgets/showDialog.dart';

void main() {
  runApp(Register());
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final usernameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final genderController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordAgainController = TextEditingController();

  Future<void> inputHandler() async {
    if (usernameController.text.length == 0 ||
        firstNameController.text == 0 ||
        lastNameController.text == 0 ||
        genderController.text == 0 ||
        emailController.text == 0 ||
        passwordController.text == 0 ||
        passwordAgainController.text == 0) {
      return ShowDialog(
          context, 'Register Error', 'You must fill the all areas!');
    }
    if (passwordController.text != passwordAgainController.text) {
      return ShowDialog(
          context, 'Register Error', 'Password values not the same!');
    }

    try {
      var values = {
        "Username": usernameController.text,
        "Email": emailController.text,
        "Gender": genderController.text,
        "FirstName": firstNameController.text,
        "LastName": lastNameController.text,
        "Password": passwordController.text
      };
      var url = Uri.parse(
          'https://cb82-94-121-163-175.eu.ngrok.io/api/Account/register');
      var response = await http.post(url,
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
          },
          body: convert.jsonEncode(values));

      if (response.statusCode == 200) {
        Navigator.pushNamed(context, '/login');
      } else if (response.statusCode == 400) {
        //print(response.body);

        //Iterable l = convert.jsonDecode(response.body);
        List<RegisterResponse> posts = List<RegisterResponse>.from(convert
            .jsonDecode(response.body)
            .map((model) => RegisterResponse.fromJson(model)));
        //return ShowDialog(context, 'Register Error', posts);
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Register Error'),
              content: SingleChildScrollView(
                child: ListBody(
                    children: posts
                        .map((e) => Text(e.description.toString()))
                        .toList()),
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
    Provider.of<Auth>(context, listen: false)
        .getToken()
        .then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                darkPinkColor,
                lightPinkColor,
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
                      borderSide: BorderSide(color: whiteColor, width: 2.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor, width: 2.5),
                    ),
                    hintText: 'Username',
                    hintStyle: TextStyle(fontSize: 14.0, color: whiteColor),
                    //contentPadding: EdgeInsets.all(30.0),
                  ),
                  controller: usernameController,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 15),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor, width: 2.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor, width: 2.5),
                    ),
                    hintText: 'First Name',
                    hintStyle: TextStyle(fontSize: 14.0, color: whiteColor),
                    //contentPadding: EdgeInsets.all(30.0),
                  ),
                  controller: firstNameController,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 15),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor, width: 2.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor, width: 2.5),
                    ),
                    hintText: 'Last Name',
                    hintStyle: TextStyle(fontSize: 14.0, color: whiteColor),
                    //contentPadding: EdgeInsets.all(30.0),
                  ),
                  controller: lastNameController,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 15),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor, width: 2.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor, width: 2.5),
                    ),
                    hintText: 'Gender',
                    hintStyle: TextStyle(fontSize: 14.0, color: whiteColor),
                    //contentPadding: EdgeInsets.all(30.0),
                  ),
                  controller: genderController,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 15),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor, width: 2.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor, width: 2.5),
                    ),
                    hintText: 'Email Address',
                    hintStyle: TextStyle(fontSize: 14.0, color: whiteColor),
                    //contentPadding: EdgeInsets.all(30.0),
                  ),
                  controller: emailController,
                ),
              ),
              SizedBox(
                height: 10,
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
                      borderSide: BorderSide(color: whiteColor, width: 2.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor, width: 2.5),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 14.0, color: whiteColor),
                    //contentPadding: EdgeInsets.all(30.0),
                  ),
                  controller: passwordController,
                ),
              ),
              SizedBox(
                height: 10,
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
                      borderSide: BorderSide(color: whiteColor, width: 2.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor, width: 2.5),
                    ),
                    hintText: 'Password(again)',
                    hintStyle: TextStyle(fontSize: 14.0, color: whiteColor),
                    //contentPadding: EdgeInsets.all(30.0),
                  ),
                  controller: passwordAgainController,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              FractionallySizedBox(
                widthFactor: 0.7,
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: inputHandler,
                    style: ElevatedButton.styleFrom(
                      primary: whiteColor,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 0.1,
                          color: darkPinkColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
