import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping/domain/authentication/bloc/authentication_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:shopping/login/bloc/login_bloc.dart';
import 'package:shopping/sample_counter/counter_bloc.dart';
import 'package:shopping/sample_counter/counter_event.dart';
import 'package:shopping/sample_counter/counter_state.dart';
import 'package:shopping/splash/splash.dart';
import 'package:user_repository/user_repository.dart';

import 'home/home.dart';
import 'login/login.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
          child: const AppView(),
        )
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});


  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator?.pushAndRemoveUntil<void>(HomePage.route(), (route) => false);
              case AuthenticationStatus.unauthenticated:
                _navigator?.pushAndRemoveUntil<void>(LoginPage.route(), (route) => false);
              case AuthenticationStatus.unknown:
                _navigator?.pushAndRemoveUntil(SplashPage.route(), (route) => false);
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
