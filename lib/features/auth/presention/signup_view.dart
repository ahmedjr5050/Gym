import 'package:fitflow/core/services/getit_services.dart';
import 'package:fitflow/features/auth/data/repos/auth_repo_imp.dart';
import 'package:fitflow/features/auth/presention/cubits/signup_cubits/sign_up_cubit.dart';
import 'package:fitflow/features/auth/presention/widgets/signup_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        getIt<AuthRepoImpl>(),
      ),
      child: Scaffold(
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
