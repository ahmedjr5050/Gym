import 'package:fitflow/core/services/getit_services.dart';
import 'package:fitflow/features/auth/data/repos/auth_repo_imp.dart';
import 'package:fitflow/features/auth/presention/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fitflow/features/auth/presention/widgets/sign_in_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  static const String routeName = 'SignInView';
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
        getIt<AuthRepoImpl>(),
      ),
      child: Scaffold(
        body: SignInBlocConsumer(),
      ),
    );
  }
}
