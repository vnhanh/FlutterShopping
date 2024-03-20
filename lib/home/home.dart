import 'package:flutter/material.dart';

/**
 * UI: https://dribbble.com/shots/22780260-Ecommerce-App-Design-Concept
 * Bloc: https://marajhussain.medium.com/flutter-bloc-clean-architecture-best-practice-news-apis-3adb0e2012cc
 * https://bloclibrary.dev/
 * Sample Github of bloc: https://github.com/felangel/bloc/tree/master
 */
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Home Page")
            ],
          )
      )
    );
  }
}