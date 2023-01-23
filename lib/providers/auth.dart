import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';

class Auth with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String?> getToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('token');
  }

  void setToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('token', token);
    notifyListeners();
  }

  String? workingWithToken(token) {
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    //print(Jwt.isExpired(token));
    return payload['nameid'];
  }
}
