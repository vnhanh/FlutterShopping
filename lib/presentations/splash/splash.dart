import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:shopping/presentations/splash/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const MySplashScreen(),
    );
  }
}

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // only hide status bar
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
      sleep(const Duration(seconds: 3));

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   // set system status bar
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarColor: Colors.white,
      //     statusBarIconBrightness: Brightness.dark,
      //     statusBarBrightness: Brightness.light,
      //   ),
      // ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: generateContent(),
      ),
    );
  }

  Widget generateContent() {
    return Image.asset(
      'assets/images/bg_splash.png',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
