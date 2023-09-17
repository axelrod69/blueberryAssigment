import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/loginModel.dart';
import '../utils/appUrl.dart';
import '../utils/routes/routeNames.dart';

class LoginViewModel with ChangeNotifier {
  Future<void> login(dynamic data, BuildContext context) async {
    Map<String, dynamic> login;

    print('Data: $data');

    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var response = await http.post(Uri.parse(Endpoints.login),
        body: json.encode(data), headers: {'Content-type': 'application/json'});

    if (response.statusCode == 200) {
      login = json.decode(response.body);

      LoginModel _loginResponse = LoginModel.fromJson(login);

      localStorage.setString('token', _loginResponse.token.toString());

      Navigator.of(context).pushNamed(RouteNames.dashboard);

      Flushbar(
        duration: const Duration(seconds: 4),
        flushbarPosition: FlushbarPosition.BOTTOM,
        borderRadius: BorderRadius.circular(10),
        icon: const Icon(Icons.error, color: Colors.white),
        leftBarIndicatorColor: Colors.red,
        // margin: const EdgeInsets.fromLTRB(100, 10, 100, 0),
        // title: 'Email',
        message: _loginResponse.message,
        barBlur: 20,
      ).show(context);
    } else {
      login = json.decode(response.body);

      LoginModel _loginResponse = LoginModel.fromJson(login);

      Flushbar(
        duration: const Duration(seconds: 4),
        flushbarPosition: FlushbarPosition.BOTTOM,
        borderRadius: BorderRadius.circular(10),
        icon: const Icon(Icons.error, color: Colors.white),
        leftBarIndicatorColor: Colors.red,
        // margin: const EdgeInsets.fromLTRB(100, 10, 100, 0),
        // title: 'Email',
        message: _loginResponse.message,
        barBlur: 20,
      ).show(context);
    }
  }

  Future<void> logout(BuildContext context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var response = await http.get(Uri.parse(Endpoints.logout), headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      localStorage.clear();

      var code = json.decode(response.body);

      print('Logout: $code');

      Navigator.of(context).pushNamed(RouteNames.onBoarding);

      Flushbar(
        duration: const Duration(seconds: 4),
        flushbarPosition: FlushbarPosition.BOTTOM,
        borderRadius: BorderRadius.circular(10),
        icon: const Icon(Icons.error, color: Colors.white),
        leftBarIndicatorColor: Colors.red,
        // margin: const EdgeInsets.fromLTRB(100, 10, 100, 0),
        // title: 'Email',
        message: 'Logged Out',
        barBlur: 20,
      ).show(context);
    } else {
      var code = json.decode(response.body);

      print('Logout: $code');
    }
  }
}
