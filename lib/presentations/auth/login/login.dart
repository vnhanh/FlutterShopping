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
  final _formKey = GlobalKey<FormState>();
  String? _email = null;
  String _password = "";

  void _submit() {
      if (_formKey.currentState?.validate() == true) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Submit SignIn")),
          );
      }
  }

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
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
            children: [
            // Input Email
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_box),
                      border: const OutlineInputBorder(),
                      label: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(AppLocalizations.of(context)?.loginEmailHint ?? ""),
                      ),
                    ),
                    validator: (value) {
                        if (value == null || value.length < 6) {
                            return AppLocalizations.of(context)?.loginEmailInvalid ?? "";
                        }
                        return null;
                    },
                    onChanged: (text) {
                        setState(() => _email = text);
                    },
                ),
            ),
            // Input Password
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, semanticLabel: "Semantic label",),
                    focusColor: Colors.blue,
                    border: const OutlineInputBorder(),
                    label: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(AppLocalizations.of(context)?.loginPasswordHint ?? ""),
                    ),
                  ),
                ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0, bottom: 116.0),
                child: ElevatedButton(
                    onPressed: _submit,
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                                return Colors.lightBlue.withOpacity(0.5);
                            }
                            return null;
                        }),
                        foregroundColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.values)) {
                                return Colors.lightBlue;
                            }
                            return null;
                        }),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                        )),
                        shadowColor: MaterialStateProperty.all(Colors.black.withOpacity(0.4)),
                        elevation: MaterialStateProperty.all(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      child: Text(
                        AppLocalizations.of(context)?.loginButton ?? "SIGN IN",
                        style: mobileTitleMediumSemiBold.copyWith(color: Colors.white),
                      ),
                    ),
                ),
            )
          ],
        ),
    );
  }
}
