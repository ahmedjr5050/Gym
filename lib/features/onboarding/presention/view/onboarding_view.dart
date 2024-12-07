import 'package:fitflow/features/onboarding/presention/view/widegts/onboard_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  
  const OnBoardingView({super.key});
  static const routeName = '/onboarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingViewBody(),
    );
  }
}