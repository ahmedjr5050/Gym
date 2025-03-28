import 'package:fitflow/features/auth/presention/forget/forget.dart';
import 'package:fitflow/features/auth/presention/sigin_view.dart';
import 'package:fitflow/features/auth/presention/signup_view.dart';
import 'package:fitflow/features/onboarding/presention/view/fitness_level.dart';
import 'package:fitflow/features/profile/presention/view/form_fit_flow.dart';
import 'package:fitflow/features/onboarding/presention/view/goal_selection.dart';
import 'package:fitflow/features/onboarding/presention/view/onboarding_view.dart';
import 'package:fitflow/features/profile/presention/view/news_screen-view.dart';
import 'package:fitflow/features/profile/presention/view/plane/screen/palne_screen_view.dart';
import 'package:fitflow/features/profile/presention/view/profile.dart';
import 'package:fitflow/features/spalsh/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {

    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (_) => const SignInView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case GoalSelection.routeName:
      return MaterialPageRoute(builder: (_) => const GoalSelection());
    case FitnessLevel.routeName:
      return MaterialPageRoute(builder: (_) => const FitnessLevel());
    case FormFitFlow.routeName:
      return MaterialPageRoute(builder: (_) => const FormFitFlow());

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpView());
    case ForgetPassword.routeName:
      return MaterialPageRoute(builder: (_) => const ForgetPassword());
    case PlaneScreen.routeName:
      return MaterialPageRoute(builder: (_) => const PlaneScreen());
    case ProfileScreen.routeName:
      return MaterialPageRoute(builder: (_) => const ProfileScreen());
    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}
