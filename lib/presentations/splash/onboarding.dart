import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping/app/theme/SAppTypography.dart';
import 'package:shopping/app/theme/SColors.dart';
import 'package:shopping/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // for Android
          statusBarBrightness: Brightness.light, // for iOS
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            createWelcomeMessage(),
            Expanded(
              child: Image.asset(
                'assets/images/onboarding.png',
                fit: BoxFit.scaleDown,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            createStartButton(),
          ],
        )
      )
    );
  }

  Widget createWelcomeMessage() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Text(
        AppLocalizations.of(context)?.onBoardingWelcome ?? "",
        style: mobileHeadlineLargeM.merge(
          const TextStyle(
            color: colorNeutral900,
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget createStartButton() {
    return ElevatedButton(
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
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ))
      ),
      onPressed: () {

      },
      child: Text(
        AppLocalizations.of(context)?.buttonStart ?? "",
        style: mobileTitleMediumSemiBold.merge(const TextStyle(color: Colors.white)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
