import 'package:fitflow/core/helper/build_error_bar.dart';
import 'package:fitflow/features/auth/presention/cubits/signup_cubits/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'signup_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showBar(context, 'Success');
          Navigator.pop(context);
        }
        if (state is SignUpError) {
          showBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading ? true : false,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}
