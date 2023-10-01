import 'package:flutter/material.dart';
import 'package:shopping/presentations/auth/login/login.dart';
import 'package:shopping/presentations/auth/signup/signup.dart';

import '../../presentations/splash/onboarding.dart';

void navigateLogin(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LoginScreen()),
  );
}

void navigateSignUp(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SignUpScreen()),
  );
}

void navigateForgotPassword(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
  );
}