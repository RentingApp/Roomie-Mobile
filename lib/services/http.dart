import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../providers/auth.dart';
import 'package:provider/provider.dart';

createHttpRequest(String endpoint, String requestType, dynamic data,
    BuildContext context) async {
  const baseUrl = 'https://5b92-176-88-79-29.eu.ngrok.io/';
  try {
    var token = null;
    await Provider.of<Auth>(context, listen: false).getToken().then((value) {
      token = value;
      //print(value);
    });

    final Map<String, String> configHeaders = {
      "content-type": "application/json",
      "accept": "application/json",
      //'Authorization': 'Bearer $token',
    };

    var url = Uri.parse(baseUrl + endpoint);
    var response;
    switch (requestType.toUpperCase()) {
      case 'POST':
        if (endpoint == 'api/Account/login') {
          response = await http.post(url,
              headers: configHeaders, body: convert.jsonEncode(data));
        } else {
          configHeaders["Authorization"] = "Bearer $token";
          response = await http.post(url,
              headers: configHeaders, body: convert.jsonEncode(data));
        }

        break;
      case 'GET':
        response = await http.get(url, headers: configHeaders);

        break;
      case 'DELETE':
        configHeaders["Authorization"] = "Bearer $token";
        response = await http.delete(url,
            headers: configHeaders, body: convert.jsonEncode(data));

        break;
      case 'UPDATE':
        response = await http.patch(url,
            headers: configHeaders, body: convert.jsonEncode(data));
        break;
    }
    print(response.statusCode);
    print(response.body);
    return response;
  } catch (err) {
    print("Uncaught error: $err");
  }
}
