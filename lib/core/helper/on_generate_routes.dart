import 'package:fitflow/features/auth/signin/presention/view/sigin_view.dart';
import 'package:fitflow/features/onboarding/presention/view/fitness_level.dart';
import 'package:fitflow/features/onboarding/presention/view/form_fit_flow.dart';
import 'package:fitflow/features/onboarding/presention/view/goal_selection.dart';
import 'package:fitflow/features/onboarding/presention/view/onboarding_view.dart';
import 'package:fitflow/features/onboarding/presention/view/profile_setup_view.dart';
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
    case ProfileSetupView.routeName:
      return MaterialPageRoute(builder: (_) => const ProfileSetupView());
    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}
