import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping/app/theme/SAppTypography.dart';
import 'package:shopping/app/theme/SColors.dart';

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
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
            ),
            toolbarHeight: 40,
            title: Center(
                child: Text(
                    AppLocalizations.of(context)?.loginTitle ?? "SIGNIN",
                    textAlign: TextAlign.center,
                    style: mobileHeadlineMediumM.copyWith(color: white),
                ),
            )
          ),
          body: SafeArea(
              child: Column(
                  children: [
                      topImage(),
                      inputFields(),
                  ],
              ),
          ),
      );
  }

  Widget topImage() {
    return Image.asset(
      'assets/images/img_login_top.jpg',
      fit: BoxFit.scaleDown,
      width: MediaQuery.of(context).size.width,
      height: 300,
    );
  }

  Widget inputFields() {
    return Column(
        children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_box),
                        border: const OutlineInputBorder(),
                        hintText: AppLocalizations.of(context)?.loginEmailHint ?? ""
                    ),
                ),
            ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      border: const OutlineInputBorder(),
                      hintText: AppLocalizations.of(context)?.loginPasswordHint ?? ""
                  ),
              ),
          )
        ],
    );
  }
}
