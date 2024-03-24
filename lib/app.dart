import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shopping/authentication/domain/authentication_bloc.dart';
import 'package:shopping/authentication/data/repository/authentication_repository.dart';
import 'package:shopping/splash/splash.dart';

import 'package:shopping/home/home.dart';
import 'package:shopping/authentication/login/presentation/login_page.dart';
import 'package:shopping/data/user/user_repository.dart';

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
            print("TestAlan - app ui - status ${state.status}");
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
