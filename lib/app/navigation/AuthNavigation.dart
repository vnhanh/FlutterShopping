import 'package:flutter/material.dart';
import 'package:shopping/presentations/authentication/login/login.dart';

void navigateLogin(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LoginScreen()),
  );
}
