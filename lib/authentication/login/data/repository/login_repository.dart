import 'dart:async';
import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import 'package:shopping/data/common/api_constants.dart';
import 'package:shopping/data/common/models.dart';
import 'package:shopping/authentication/login/data/model/login_response.dart';

Future<Either<ApiError, LoginResponse>> loginWithPassword(String phone, String password) async {
  final http.Response response = await http.post(
    Uri.parse("${authBaseUrl}auth/login"),
    headers: <String,String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String,String>{
      'phone': phone,
      'password': password
    })
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    print("Alan - json ${json}");
    BaseResponse<LoginResponse> parsedResponse = BaseResponse<LoginResponse>.fromJson(json, () => LoginResponse.fromJson(json['result']));
    LoginResponse? resultResponse = parsedResponse.result;

    return resultResponse != null ? Either.right(resultResponse) : Either.left(ApiError.getUnknownError());
  } else {
    print("Alan - status code ${response.body}");
    // response.body
    // Either.left(ApiError());
    return Either.left(ApiError.getUnknownError());
  }
}