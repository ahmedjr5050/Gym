import 'package:fitflow/constant.dart';
import 'package:fitflow/core/helper/build_error_bar.dart';
import 'package:fitflow/core/services/shared_preferences_singleton.dart';
import 'package:fitflow/core/widgets/custom_progress_hub.dart';
import 'package:fitflow/features/auth/presention/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fitflow/features/auth/presention/widgets/signin_view_body.dart';
import 'package:fitflow/features/profile/presention/view/news_screen-view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBlocConsumer extends StatefulWidget {
  const SignInBlocConsumer({
    super.key,
  });

  @override
  State<SignInBlocConsumer> createState() => _SignInBlocConsumerState();
}

class _SignInBlocConsumerState extends State<SignInBlocConsumer> {
  @override
  void initState() {
    ecute(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Prefs.setBool(kIslogin, true);
          Navigator.pushNamedAndRemoveUntil(
              context, NewsScreenView.routeName, (route) => false);
        }
        if (state is SignInError) {
          showBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomIndicator(
          isLoading: state is SignInLoading,
          child: SigninViewBody(),
        );
      },
    );
  }

  void ecute(BuildContext context) {
    bool islogin = Prefs.getBool(kIslogin);
    Future.delayed(const Duration(seconds: 3), () {
      if (islogin) {
        Navigator.pushReplacementNamed(context, NewsScreenView.routeName);
      } else {
        return;
      }
    });
  }
}
