import 'package:fitflow/features/auth/signup/presention/view/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
static const String routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SignUpViewBody(),
    );
  }
}