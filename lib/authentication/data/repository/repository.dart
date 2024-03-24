import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, unauthenticated, authenticated }

extension AuthenticationStatusExt on String? {
  AuthenticationStatus toAuthStatus() {

    if (this == AuthenticationStatus.unauthenticated.name) {
      return AuthenticationStatus.unauthenticated;
    } else if(this == AuthenticationStatus.authenticated.name) {
      return AuthenticationStatus.authenticated;
    } else {
      return AuthenticationStatus.unknown;
    }
  }
}

class AuthenticationRepository {
  String authenticationStatusKey = "authentication_status";
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    SharedPreferences sp = await SharedPreferences.getInstance();
    AuthenticationStatus currentAuthenticationStatus = sp.getString(authenticationStatusKey).toAuthStatus();

    if (currentAuthenticationStatus == AuthenticationStatus.unknown) {
      currentAuthenticationStatus = AuthenticationStatus.unauthenticated;
      sp.setString(authenticationStatusKey, currentAuthenticationStatus.name);
    }

    yield currentAuthenticationStatus;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String phoneNumber,
    required String passWord
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await Future.delayed(
      const Duration(milliseconds: 300),
        () {
          sp.setString(authenticationStatusKey, AuthenticationStatus.authenticated.name);
          _controller.add(AuthenticationStatus.authenticated);
        },
    );
  }

  void logOut() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(authenticationStatusKey, AuthenticationStatus.authenticated.name);
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
