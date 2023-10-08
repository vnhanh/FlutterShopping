import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shopping/data/remote/base/api_constants.dart';


Future<http.Response> loginWithPassword({required String phoneNumber, required String password}) async {
  return http.post(
      Uri.parse("${authBaseUrl}auth/login"),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String,String>{
        'phone': phoneNumber,
        'password': password
      })
  );
}