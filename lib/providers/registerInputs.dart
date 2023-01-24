import 'package:flutter/material.dart';

class RegisterInputs with ChangeNotifier {
  String stepA = 'initial';
  String stepB = 'initial';
  String stepC = 'initial';
  String username = '';
  String firstName = '';
  String lastName = '';
  String gender = 'Gender';
  String email = '';
  String password = '';
  String passwordAgain = '';

  String get getStepAStatus => stepA;
  String get getStepBStatus => stepB;
  String get getStepCStatus => stepC;
  String get getUsername => username;
  String get getFirstName => firstName;
  String get getLastName => lastName;
  String get getGender => gender;
  String get getEmail => email;
  String get getPassword => password;
  String get getPasswordAgain => passwordAgain;

  void controlInputValues_profile(Map<String, dynamic> currentInputValues) {
    notifyListeners();
  }

  void setUsername(String enteredName) {
    username = enteredName;
    notifyListeners();
  }

  void setFirstName(String enteredFirstName) {
    firstName = enteredFirstName;
    notifyListeners();
  }

  void setLastName(String enteredLastName) {
    lastName = enteredLastName;
    notifyListeners();
  }

  void setGender(String enteredGender) {
    gender = enteredGender;
    notifyListeners();
  }

  void setEmail(String enteredEmail) {
    email = enteredEmail;
    notifyListeners();
  }

  void setPassword(String enteredPassword) {
    password = enteredPassword;
    notifyListeners();
  }

  void setPasswordAgain(String enteredPasswordAgain) {
    passwordAgain = enteredPasswordAgain;
    notifyListeners();
  }

  void controlStepA() {
    if (username.trim() == '' ||
        firstName.trim() == '' ||
        lastName.trim() == '') {
      stepA = 'error';
    } else {
      stepA = 'initial';
    }
    notifyListeners();
  }

  void controlStepB() {
    if (gender == 'Gender') {
      stepB = 'error';
    } else {
      stepB = 'initial';
    }
    notifyListeners();
  }

  void controlStepC() {
    if (email.trim() == '' ||
        password.trim() == '' ||
        passwordAgain.trim() == '') {
      stepC = 'error';
    } else {
      stepC = 'initial';
    }
    notifyListeners();
  }
}
