import 'package:flutter/material.dart';
import 'package:shopping/presentations/splash/onboarding.dart';
import 'package:shopping/presentations/splash/splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const SplashScreen());
  // runApp(const OnBoardingScreen());
}

class SAppWrapperLayout extends StatefulWidget {
  const SAppWrapperLayout({super.key, required this.child});

  final Widget child;

  @override
  State<StatefulWidget> createState() => _SAppWrapperState();
}

class _SAppWrapperState extends State<SAppWrapperLayout> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale("vi"),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        brightness: Brightness.light,
        fontFamily: 'Roboto',
      ),
      home: widget.child,
    );
  }
}
