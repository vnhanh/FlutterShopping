import 'package:flutter/material.dart';
import 'package:shopping/app/common/ImagePaths.dart';
import 'package:shopping/app/theme/SAppTypography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../main.dart';
import '../../../app/theme/SAppTypography.dart';
import '../../../app/theme/SColors.dart';

class SignUpScreen extends StatelessWidget {
    const SignUpScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return const SAppWrapperLayout(
          child: SignUpScreenStatefulWidget(),
        );
    }
}

class SignUpScreenStatefulWidget extends StatefulWidget {
    const SignUpScreenStatefulWidget({super.key});

    @override
    State<StatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignUpScreenStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  String? _email = null;
  String _password = "";

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            toolbarHeight: 40,
            title: Text(
              AppLocalizations.of(context)?.signupActionBarTitle ?? "ĐĂNG KÝ",
              textAlign: TextAlign.center,
              style: mobileHeadlineMediumM.copyWith(color: white),
            )
          ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                  flex: 1,
                  child: BodyContent()
              ),
              // footer()
            ],
          )
        )
      );
  }

  Widget BodyContent() {
      return Column(
        children: [
            ImageHeader(),
            MainContent()
        ],
      );
  }

  Widget ImageHeader() {
      return Image.asset(
        imgPathLoginHeader,
        fit: BoxFit.fill,
        height: 300,
      );
  }

  Widget MainContent() {
      return Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                  children: [
                    InputFieldEmail(),
                    paddingVertical(16.0),
                    InputFieldPassWord(),
                    paddingVertical(32.0),
                    ButtonSignUp(),
                  ],
              )
          )
      );
  }

  Widget InputFieldEmail() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_box),
        border: const OutlineInputBorder(),
        label: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(AppLocalizations.of(context)?.signupLabelPhone ?? ""),
        ),
      ),
      validator: (value) {
        if (value == null || value.length < 6) {
          return AppLocalizations.of(context)?.signupPhoneInvalid ?? "Email không hợp lệ";
        }
        return null;
      },
      onChanged: (text) {
        setState(() => _email = text);
      },
    );
  }

  Widget InputFieldPassWord() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.lock,
          semanticLabel: "Semantic label",
        ),
        focusColor: Colors.blue,
        border: const OutlineInputBorder(),
        label: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(AppLocalizations.of(context)?.signupLabelPassword ?? "Mật khẩu không hợp lệ"),
        ),
      ),
      validator: (value) {
        if (value == null || value.length < 6) {
          return AppLocalizations.of(context)?.signupPasswordInvalid ?? "Mật khẩu không hợp lệ";
        }
        return null;
      },
    );
  }

  Widget ButtonSignUp() {
    return ElevatedButton(
      onPressed: () {
        // TODO
      },
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
          AppLocalizations.of(context)?.signupButtonSignUp ?? "ĐĂNG KÝ",
          style: mobileTitleMediumSemiBold.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget paddingVertical(height) {
    return SizedBox(width: height, height: height);
  }
}