import 'package:fitflow/features/auth/signin/presention/view/widgets/signin_view_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  static const String routeName = 'SignInView';
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SigninViewBody(),
    );
  }
}
