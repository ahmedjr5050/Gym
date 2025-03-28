import 'dart:developer';

import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/core/widgets/custom_button_widget.dart';
import 'package:fitflow/features/profile/presention/view/profile_setup_view.dart';
import 'package:fitflow/features/onboarding/presention/view/widegts/custom_form_field.dart';
import 'package:fitflow/features/profile/presention/view/widgets/custom_section_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormFieldProfile extends StatefulWidget {
  const CustomFormFieldProfile({
    super.key,
  });

  @override
  State<CustomFormFieldProfile> createState() => _CustomFormFieldProfileState();
}

class _CustomFormFieldProfileState extends State<CustomFormFieldProfile> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _formAutovalidateMode = AutovalidateMode.disabled;

  String? gender;
  String? hypertension;
  String? diabetic;
  int? _age;
  int? _weight;
  double? _height;

  // Validators
  String? _validateAge(String? value) {
    final age = int.tryParse(value ?? '');
    if (age == null || age < 18 || age > 100) {
      return 'Please enter a valid age between 18 and 100.';
    }
    return null;
  }

  String? _validateHeight(String? value) {
    final height = double.tryParse(value ?? '');
    if (height == null || height < 1.50 || height > 2.50) {
      return 'Please enter a valid height between 50 and 250 cm.';
    }
    return null;
  }

  String? _validateWeight(int? value) {
    final weight = value;
    if (weight == null || weight < 20 || weight > 200) {
      return 'Please enter a valid weight between 20 and 200 kg.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 620.h,
      width: 340.w,
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: _formKey,
        autovalidateMode: _formAutovalidateMode,
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
                onSaved: (value) => _age = int.tryParse(value ?? ''),
                validator: _validateAge,
                label: 'Age     ',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                hint: 'Your Height',
                onSaved: (value) => _height = double.tryParse(value ?? ''),
                validator: _validateHeight,
                label: 'Height ',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                label: 'Weight ',
                hint: 'Your Weight',
                onSaved: (value) => _weight = int.tryParse(value ?? ''),
                validator: (value) =>
                    _validateWeight(int.tryParse(value ?? '')),
                keyboardType: TextInputType.number,
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
                // Save gender selection
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
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
                onChanged: (value) {
                  setState(() {
                    hypertension = value;
                  });
                },
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
                onChanged: (value) {
                  setState(() {
                    diabetic = value;
                  });
                },
              ),
              SizedBox(height: 10.h),
              CustomButtonWidget(
                backgroundColor: Colors.white,
                textStyle: TextStyles.bold18.copyWith(color: AppColors.blue),
                width: 310,
                height: 70,
                text: 'Next',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    log(
                      'gender: $gender, hypertension: $hypertension, diabetic: $diabetic, age: $_age, weight: $_weight, height: $_height',
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfileSetupView(
                          gender: gender,
                          age: _age,
                          height: _height,
                          weight: _weight,
                          diabetic: diabetic,
                          hypertension: hypertension,
                        ),
                      ),
                    );
                    log(_weight.toString());
                    print({
                      'gender': gender,
                      'hypertension': hypertension,
                      'diabetic': diabetic,
                      'age': _age,
                      'weight': _weight,
                      'height': _height,
                    });
                  } else {
                    print("Form is not valid!");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
