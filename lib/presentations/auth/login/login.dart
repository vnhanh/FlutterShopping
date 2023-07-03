import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping/main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return const SAppWrapperLayout(
          child: LoginScreenStatefulWidget(),
      );
  }
}

class LoginScreenStatefulWidget extends StatefulWidget {
  const LoginScreenStatefulWidget({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenStatefulWidget> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Image.asset(
                  'assets/images/bg_login.jpg',
                  fit: BoxFit.scaleDown,
                  width: MediaQuery.of(context).size.width,
                  height: 300,
              ),
              const Text("Login"),
            ],
          ),
        ),
      );
  }
}
