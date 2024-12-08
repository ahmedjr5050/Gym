import 'package:fitflow/constant.dart';
import 'package:fitflow/core/services/shared_preferences_singleton.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/features/auth/signin/presention/view/sigin_view.dart';
import 'package:fitflow/features/onboarding/presention/view/onboarding_view.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    excuteNavigaion();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Logo.png',
          ),
          Text(
            '"Your Fitness Journey Starts Here."',
            style: TextStyles.bold18.copyWith(
              fontSize: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  void excuteNavigaion() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, SignInView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
