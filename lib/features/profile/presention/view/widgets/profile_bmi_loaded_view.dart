import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/core/widgets/custom_button_widget.dart';
import 'package:fitflow/features/profile/domain/models/entities.dart';
import 'package:fitflow/features/profile/presention/view/news_screen-view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBmiLoadedView extends StatelessWidget {
  final FitnessData fitnessData;

  const ProfileBmiLoadedView({
    super.key,
    required this.fitnessData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 18.h),
            Image.asset(Assets.imagesLogo),
            Container(
              width: 330.w,
              height: 500.h,
              decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(height: 18.h),
                  Image.asset(Assets.imagesWelcomeprofile),
                  SizedBox(height: 34.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Your Bmi Is ',
                          style: TextStyles.bold18,
                        ),
                        TextSpan(
                          text: '${fitnessData.bmi} ',
                          style: TextStyles.bold18.copyWith(
                            fontSize: 24,
                          ),
                        ),
                        TextSpan(
                          text: 'and This Is\n \n',
                          style: TextStyles.bold18,
                        ),
                        TextSpan(
                          text: '             very Good',
                          style: TextStyles.bold18,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustomButtonWidget(
                    text: 'Start',
                    textStyle: TextStyles.bold18.copyWith(color: Colors.white),
                    width: 300.w,
                    height: 70.h,
                    backgroundColor: AppColors.green,
                    borderRadius: BorderRadius.circular(10),
                    onPressed: () {
                      Navigator.pushNamed(context, NewsScreenView.routeName);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
