import 'package:flutter/material.dart';
import 'package:shopping/authentication/login/view/color_gradient.dart';
import 'package:shopping/common/widgets/gradient_text.dart';
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
          bodyCard(),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      width: double.infinity,
      height: 350.0,
      decoration: const BoxDecoration(
        gradient: LoginGradient.loginBgGradient,
      ),
      child: const Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Image(image: AssetImage('assets/images/login/shopping-header-login-image.png'))
        ),
      ),
    );
  }

  Widget bodyCard() {
    return Container(
      margin: const EdgeInsets.only(top: 72.0),
      width: double.infinity,
      // margin: const EdgeInsets.only(top: 32.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(28.0), topRight: Radius.circular(28.0)),
        color: Colors.white,
      ),
      child: ListView(
        children: const [
          Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Align(
                alignment: Alignment.center,
                child: GradientText(
                  "Shop Alan",
                  style: TextStyle(color: Colors.purpleAccent, fontWeight: FontWeight.w700, fontSize: 20.0),
                  gradient: LoginGradient.loginBgGradient,
                ),
              )
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
            child: LoginForm(),
          )
        ],
      ),
    );
  }
}

