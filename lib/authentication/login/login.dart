import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/authentication/login/domain/bloc/login_bloc.dart';
import 'package:shopping/authentication/login/view/login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
        builder: (context) => BlocProvider(
          create: (context) => LoginBloc(authenticationRepository: RepositoryProvider.of(context)),
          child: const LoginPage(),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginView()
    );
  }
}
