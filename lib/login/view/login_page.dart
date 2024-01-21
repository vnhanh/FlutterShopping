import 'package:flutter/material.dart';
import 'package:shopping/login/view/color_gradient.dart';

import 'login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          header(),
          bodyCard()
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      width: double.infinity,
      height: 120.0,
      decoration: const BoxDecoration(
        gradient: LoginGradient.loginBgGradient,
      ),
      child: const Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Shoppo",
            style: TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget bodyCard() {
    return Container(
      margin: const EdgeInsets.only(top: 100.0),
      width: double.infinity,
      // margin: const EdgeInsets.only(top: 32.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
        color: Colors.white,
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Positioned(
              top: 20.0,
              child: LoginForm()
          )
        ],
      ),
    );
  }

  // Widget bodyCard() {
  //   return Positioned(
  //     top: 100.0,
  //     child: Text("Text"),
  //     child: Container(
  //       width: double.infinity,
  //       height: double.infinity,
  //       // margin: const EdgeInsets.only(top: 32.0),
  //       decoration: const BoxDecoration(
  //         borderRadius: BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
  //         color: Colors.white,
  //       ),
  //       child: const LoginForm(),
  //     ),
  //   );
  // }
}

