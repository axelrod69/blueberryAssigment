import 'package:another_flushbar/flushbar.dart';
import 'package:blueberry_assignment/utils/appUrl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/userListModel.dart';

class UserListViewModel with ChangeNotifier {
  List<Data> _users = [];

  List<Data> get users {
    return [..._users];
  }

  Future<void> fetchUsers(BuildContext context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var jsonResponse;

    var response = await http.get(Uri.parse(Endpoints.getUsers), headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      var userDataList = jsonResponse['data'] as List<dynamic>;
      _users = userDataList.map((data) => Data.fromJson(data)).toList();

      notifyListeners();
    } else {
      Flushbar(
        duration: const Duration(seconds: 4),
        flushbarPosition: FlushbarPosition.BOTTOM,
        borderRadius: BorderRadius.circular(10),
        icon: const Icon(Icons.error, color: Colors.white),
        leftBarIndicatorColor: Colors.red,
        // margin: const EdgeInsets.fromLTRB(100, 10, 100, 0),
        // title: 'Email',
        message: 'An Error Occured',
        barBlur: 20,
      ).show(context);
    }
  }
}
