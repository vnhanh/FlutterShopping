import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/login/bloc/login_bloc.dart';
import 'package:shopping/login/view/login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Alan - showing LoginPage()");
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
              authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(context)
          );
        },
        child: const LoginView(),
      )
    );
  }
}
