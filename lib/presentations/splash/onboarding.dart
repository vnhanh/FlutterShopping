import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping/app/locale/SAppLocalizations.dart';
import 'package:shopping/app/theme/SAppTypography.dart';
import 'package:shopping/app/theme/SColors.dart';
import 'package:shopping/main.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SAppWrapperLayout(
      child: OnBoardingStatefulWidget(),
    );
  }
}

class OnBoardingStatefulWidget extends StatefulWidget {
  const OnBoardingStatefulWidget({super.key});

  @override
  State<StatefulWidget> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingStatefulWidget> {
  double statusBarHeight = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
      setState(() {
        statusBarHeight = MediaQuery.of(context).viewPadding.top;
        print("status bar height: $statusBarHeight");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // String header = SAppLocalizations.of(context)?.getText("onboarding") ?? "Chào mừng bạn đến với siêu ứng dụng mua sắm";
    String header = "Chào mừng bạn đến với siêu ứng dụng mua sắm";

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // for Android
          statusBarBrightness: Brightness.light, // for iOS
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                header,
                style: mobileHeadlineLargeM.merge(
                  const TextStyle(
                    color: colorNeutral900,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // SizedBox.expand(
            //   child: Image.asset(
            //     'assets/images/bg_onboarding.png',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            Text(
              "Bat dau"
            )
          ],
        )
      )
    );
  }
}
