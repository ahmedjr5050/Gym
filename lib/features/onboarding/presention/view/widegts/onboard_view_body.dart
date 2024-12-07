import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/core/widgets/custom_button_widget.dart';
import 'package:fitflow/features/auth/signin/presention/view/sigin_view.dart';
import 'package:fitflow/features/onboarding/presention/view/goal_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 56.h),
          Image.asset(
            'assets/images/Logo.png',
            fit: BoxFit.contain,
            width: 250,
          ),
          const SizedBox(height: 20),
          CustomButtonWidget(
            width: 330,
            height: 91,
            backgroundColor: AppColors.green,
            borderRadius: BorderRadius.circular(10),
            text: 'Get Started',
            textStyle: TextStyles.bold18.copyWith(
              fontSize: 20,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, GoalSelection.routeName);
            },
          ),
          SizedBox(height: 38.h),
          CustomButtonWidget(
            width: 330,
            height: 91,
            backgroundColor: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            text: 'Sign in',
            textStyle: TextStyles.bold18.copyWith(
              fontSize: 20,
              color: AppColors.blue,
            ),
            onPressed: () {
              Navigator.pushNamed(context, SignInView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
