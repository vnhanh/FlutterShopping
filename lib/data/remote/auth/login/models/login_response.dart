

import 'dart:ffi';

class BaseResponse<T> {
  final int? id;
  final String? message;
  final T? result;

  const BaseResponse({this.id, this.message, this.result});

  factory BaseResponse.fromJson(Map<String,dynamic> json, T? Function() jsonDecodeResult) {
    return BaseResponse(
        id: json['id'],
        message: json['message'],
        result: jsonDecodeResult(),
    );
  }
}

class LoginResponse {
  final String? accessToken;
  final Bool? verify;
  final String? accessTokenExpired;
  final String? refreshToken;
  final String? refreshTokenExpired;
  // final UserProfile? userProfile;

  const LoginResponse({this.accessToken, this.verify, this.accessTokenExpired, this.refreshToken, this.refreshTokenExpired});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['access_token'],
      verify: json['verify'],
      accessTokenExpired: json['access_token_expires_at'],
      refreshToken: json['refresh_token'],
      refreshTokenExpired: json['refresh_token_expires_at'],
      // profileUUID: json['user_profile'],
      // userProfile: UserProfile.fromJson(json['user_profile'])
    );
  }
}

// class UserProfile {
//   final String? id;
//   final String? userUuid;
//   final String? roleSlug;
//   final String? uuid;
//   final String? password;
//   final String? fullName;
//   final String? birthday;
//   final int? gender;
//   final String? email;
//   final List<Child>? children;
//   final
//
//   factory UserProfile.fromJson(Map<String, dynamic> json) {
//     return UserProfile(
//
//     );
//   }
// }