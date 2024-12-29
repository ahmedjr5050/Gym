import 'package:fitflow/features/spalsh/presention/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff007AFF),
      body: SplashViewBody(),
    );
  }
}
