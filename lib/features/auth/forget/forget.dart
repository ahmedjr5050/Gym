import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/core/widgets/custom_button_widget.dart';
import 'package:fitflow/features/auth/signin/presention/view/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  static const String routeName = '/forget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Image.asset(
                Assets.imagesLogo,
              ),
              Container(
                width: 330.w,
                height: 350.h,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Forget Password?',
                      style: TextStyles.medium24.copyWith(
                        color: AppColors.blue,
                      ),
                    ),
                    CustomTextFieldWithLabel(
                      keyboardType: TextInputType.emailAddress,
                      label: 'Enter Your Email',
                      hintText: 'Enter your email here',
                      labelStyle: TextStyles.bold18,
                      hintStyle: TextStyles.light16,
                    ),
                    CustomButtonWidget(
                      text: 'Send',
                      onPressed: () {},
                      width: 330,
                      height: 70,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
