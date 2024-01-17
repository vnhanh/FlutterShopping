
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Header(),
          BodyCard()
        ],
      ),
    );
  }

  Widget Header() {
    return Container(
      width: double.infinity,
      height: 120.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.blue.withOpacity(0.5),
              Colors.purple.withOpacity(0.7),
            ],
        ),
      ),
    );
  }

  Widget BodyCard() {
    return Container(
      margin: const EdgeInsets.only(top: 80.0),
      width: double.infinity,
      // margin: const EdgeInsets.only(top: 32.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
        color: Colors.white,
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text("Shoppo"),
          ),
          Positioned(
              top: 20.0,
              child: LoginForm()
          )
        ],
      ),
    );
  }
}
