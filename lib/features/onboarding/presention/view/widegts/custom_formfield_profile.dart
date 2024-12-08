import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/core/widgets/custom_button_widget.dart';
import 'package:fitflow/features/onboarding/presention/view/profile_setup_view.dart';
import 'package:fitflow/features/onboarding/presention/view/widegts/custom_form_field.dart';
import 'package:fitflow/features/onboarding/presention/view/widegts/custom_section_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormFieldProfile extends StatelessWidget {
  const CustomFormFieldProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520.h,
      width: 340.w,
      decoration: BoxDecoration(
        color: Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: [
            Text(
              'Profile Setup',
              style: TextStyles.medium24.copyWith(
                color: AppColors.blue,
              ),
            ),
            SizedBox(height: 49.h),
            CustomTextFormField(
              hint: 'Your Age',
              controller: TextEditingController(),
              label: 'Age      ',
            ),
            SizedBox(height: 10.h),
            CustomTextFormField(
              hint: 'Your Height',
              controller: TextEditingController(),
              label: 'Height ',
            ),
            SizedBox(height: 10.h),
            CustomTextFormField(
              label: 'Weight ',
              hint: 'Your Weight',
              controller: TextEditingController(),
            ),
            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Gender:',
                  style: TextStyles.bold18.copyWith(color: AppColors.black)),
            ),
            SizedBox(height: 8.h),
            CustomSectionCheckbox(
              labelsOne: 'Male',
              labelsTwo: 'Female',
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Hypertension:',
                  style: TextStyles.bold18.copyWith(color: AppColors.black)),
            ),
            SizedBox(height: 8.h),
            CustomSectionCheckbox(
              labelsOne: 'Yes',
              labelsTwo: 'No',
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Diabetic:',
                  style: TextStyles.bold18.copyWith(color: AppColors.black)),
            ),
            SizedBox(height: 8.h),
            CustomSectionCheckbox(
              labelsOne: 'Yes',
              labelsTwo: 'No',
            ),
            SizedBox(height: 10.h),
            CustomButtonWidget(
                backgroundColor: Colors.white,
                textStyle: TextStyles.bold18.copyWith(color: AppColors.blue),
                width: 310,
                height: 70,
                text: 'Next',
                onPressed: () {
                  Navigator.pushNamed(context, ProfileSetupView.routeName);
                }),
          ],
        ),
      ),
    );
  }
}
