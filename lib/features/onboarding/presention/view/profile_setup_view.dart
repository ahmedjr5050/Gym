import 'package:fitflow/features/onboarding/presention/view/widegts/profile_setup_body.dart';
import 'package:flutter/material.dart';

class ProfileSetupView extends StatelessWidget {
  static const routeName = '/profile_setup_view';
  const ProfileSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileSetupBody(),
    );
  }
}
