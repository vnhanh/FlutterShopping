import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping/app/navigation/AuthNavigation.dart';
import 'package:shopping/domain/authentication/bloc/authentication_bloc.dart';
import 'package:shopping/presentations/splash/splash.dart';
import 'package:user_repository/user_repository.dart';

import '../../../main.dart';
import '../../../app/theme/SAppTypography.dart';
import '../../../app/theme/SColors.dart';
import '../../../app/common/images.dart';
import '../../../data/remote/auth/login/login_repository.dart';
import '../../../data/remote/auth/login/models/login_response.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const SAppWrapperLayout(
//       child: LoginScreenStatefulWidget(),
//     );
//   }
// }
//
// class LoginScreenStatefulWidget extends StatefulWidget {
//   const LoginScreenStatefulWidget({super.key});
//
//   @override
//   State<StatefulWidget> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreenStatefulWidget> {
//
//   final _formKey = GlobalKey<FormState>();
//   String _phone = "";
//   String _password = "";
//   Future<BaseResponse<LoginResponse>>? _loginResponse;
//
//   void _submit() {
//     if (_formKey.currentState?.validate() == true) {
//       showLoading();
//       // setState(() {
//       //   _loginResponse = loginWithPassword(_phone, _password);
//       // });
//     }
//   }
//
//   showLoading() {
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) =>  const Opacity(
//           opacity: 1,
//           child: Center(
//             child: SizedBox(
//               width: 32,
//               height: 32,
//               child: CircularProgressIndicator(),
//             ),
//           ),
//         )
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//           systemOverlayStyle: const SystemUiOverlayStyle(
//             statusBarColor: Colors.white,
//             statusBarBrightness: Brightness.light,
//             statusBarIconBrightness: Brightness.dark,
//           ),
//           toolbarHeight: 40,
//           title: Center(
//             child: Text(
//               AppLocalizations.of(context)?.loginTitle ?? "ĐĂNG NHẬP",
//               textAlign: TextAlign.center,
//               style: mobileHeadlineMediumM.copyWith(color: white),
//             ),
//           )),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 Flexible(
//                     flex: 1,
//                     // contains image on header, input fields, link forgot password and button login
//                     child: bodyContent()
//                 ),
//                 footer()
//               ],
//             ),
//             (_loginResponse != null ) ? buildFutureBuilder() : Container()
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget bodyContent() {
//     return Column(
//       children: [
//         imageHeader(),
//         // contains input fields, link forgot password and button login
//         mainContent(),
//       ],
//     );
//   }
//
//   Widget loadingFullScreen() {
//     return Container(
//         color: Colors.black54,
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: const Center(
//           child: CircularProgressIndicator(),
//         )
//     );
//   }
//
//   FutureBuilder buildFutureBuilder() {
//     return FutureBuilder<BaseResponse<LoginResponse>>(
//       future: _loginResponse,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           Navigator.of(context, rootNavigator: true).pop();
//           return const Text("Logged in!");
//         } else if (snapshot.hasError) {
//           Navigator.of(context, rootNavigator: true).pop();
//           return Text("Log in failed with error ${snapshot.error}");
//         }
//         print("Alan - show loading");
//
//         return Container();
//       },
//     );
//   }
//
//   Widget imageHeader() {
//     return Image.asset(
//       imgPathLoginHeader,
//       fit: BoxFit.scaleDown,
//       width: MediaQuery.of(context).size.width,
//       height: 300,
//     );
//   }
//
//   Widget mainContent() {
//     return Form(
//       key: _formKey,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             inputFieldPhone(),
//             paddingVertical(16.0),
//             inputFieldPassWord(),
//             paddingVertical(32.0),
//             buttonLogin(),
//             paddingVertical(16.0),
//             linkToForgotPassword()
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget inputFieldPhone() {
//     return TextFormField(
//       decoration: InputDecoration(
//         prefixIcon: const Icon(Icons.account_box),
//         border: const OutlineInputBorder(),
//         label: Padding(
//           padding: const EdgeInsets.only(top: 4.0),
//           child: Text(AppLocalizations.of(context)?.loginPhoneHint ?? ""),
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.length < 6) {
//           return AppLocalizations.of(context)?.loginPhoneInvalid ?? "";
//         }
//         return null;
//       },
//       onChanged: (text) {
//         setState(() => _phone = text);
//       },
//     );
//   }
//
//   Widget inputFieldPassWord() {
//     return TextFormField(
//       obscureText: true,
//       decoration: InputDecoration(
//         prefixIcon: const Icon(
//           Icons.lock,
//           semanticLabel: "Semantic label",
//         ),
//         focusColor: Colors.blue,
//         border: const OutlineInputBorder(),
//         label: Padding(
//           padding: const EdgeInsets.only(top: 4.0),
//           child: Text(AppLocalizations.of(context)?.loginPasswordHint ?? ""),
//         ),
//       ),
//       onChanged: (text) {
//         setState(() {
//           _password = text;
//         });
//       },
//     );
//   }
//
//   Widget buttonLogin() {
//     return ElevatedButton(
//       onPressed: _submit,
//       style: ButtonStyle(
//         overlayColor: MaterialStateProperty.resolveWith((states) {
//           if (states.contains(MaterialState.pressed)) {
//             return Colors.lightBlue.withOpacity(0.5);
//           }
//           return null;
//         }),
//         foregroundColor: MaterialStateProperty.resolveWith((states) {
//           if (states.contains(MaterialState.values)) {
//             return Colors.lightBlue;
//           }
//           return null;
//         }),
//         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16.0),
//         )),
//         shadowColor: MaterialStateProperty.all(Colors.black.withOpacity(0.4)),
//         elevation: MaterialStateProperty.all(8.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//         child: Text(
//           AppLocalizations.of(context)?.loginButton ?? "SIGN IN",
//           style: mobileTitleMediumSemiBold.copyWith(color: Colors.white),
//         ),
//       ),
//     );
//   }
//
//   Widget linkToForgotPassword() {
//     return Row(
//       children: [
//         RichText(
//             text: TextSpan(
//                 text: AppLocalizations.of(context)?.loginForgotPassword ?? "Quên mật khẩu ?",
//                 style: mobileLabelMedium.copyWith(
//                   color: color_1966DC,
//                 ),
//                 recognizer: TapGestureRecognizer()
//                   ..onTap = () {
//                     print("Alan - tap");
//                   })
//         )
//       ],
//     );
//   }
//
//   Widget footer() {
//     return Column(
//       children: [
//         paddingVertical(16.0),
//         composeLinkToSignUp(),
//         paddingVertical(24.0)
//       ],
//     );
//   }
//
//   Widget composeLinkToSignUp() {
//     return Align(
//       alignment: Alignment.center,
//       child: RichText(
//         text: TextSpan(
//             text: AppLocalizations.of(context)?.loginRegisterDescription ?? "Bạn chưa có tài khoản ? ",
//             style: mobileLabelMedium.copyWith(
//               color: color_11161D,
//             ),
//             children: <TextSpan> [
//               TextSpan(
//                 text: AppLocalizations.of(context)?.loginRegisterLink ?? "Đăng ký ngay",
//                 style: mobileLabelMedium.copyWith(
//                   decoration: TextDecoration.underline,
//                 ),
//                 recognizer: TapGestureRecognizer()
//                   ..onTap = () {
//                     navigateSignUp(context);
//                   }
//               )
//             ]
//         ),
//       )
//     );
//   }
//
//   Widget paddingVertical(height) {
//     return SizedBox(width: height, height: height);
//   }
// }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginScreen> {
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
            authenticationRepository: _authenticationRepository,
            userRepository: _userRepository
        ),
        child: const LoginStateHandler()
      )
    );
  }
}

class LoginStateHandler extends StatefulWidget {
  const LoginStateHandler({super.key});

  @override
  State<StatefulWidget> createState() => _LoginStateHandler();
}

class _LoginStateHandler extends State<LoginStateHandler> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  // NavigatorState get _navigator => _navigator.currentState;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated: {
                print("Alan - screen - authenticated");
                // _navigator.pushAndRemoveUntil<void>(`, (route) => false)
              }
              case AuthenticationStatus.unauthenticated: {

              }
              case AuthenticationStatus.unknown: break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashScreen.route(),
    );
  }
}
