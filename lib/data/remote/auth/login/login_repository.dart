import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../base/api_constants.dart';
import 'models/login_response.dart';

Future<BaseResponse<LoginResponse>> loginWithPassword(String phone, String password) async {
  final response = await http.post(
    Uri.parse("${authBaseUrl}auth/login"),
    headers: <String,String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String,String>{
      'phone': phone,
      'password': password
    })
  );
  await(Future.delayed(Duration(seconds: 3)));
  if (response.statusCode < 300) {
    final json = jsonDecode(response.body);
    print("Alan - json ${json}");
    return BaseResponse<LoginResponse>.fromJson(json, () => LoginResponse.fromJson(json['result']) );
  } else {
    print("Alan - status code ${response.statusCode}");
    throw Exception('Failed to call api');
  }
}