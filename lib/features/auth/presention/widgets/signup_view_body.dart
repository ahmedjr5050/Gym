import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/core/widgets/custom_button_widget.dart';
import 'package:fitflow/features/auth/presention/cubits/signup_cubits/sign_up_cubit.dart';
import 'package:fitflow/features/auth/presention/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
AutovalidateMode _formAutovalidateMode = AutovalidateMode.disabled;
late String _email, _password;

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _formAutovalidateMode,
          child: Column(
            children: [
              Image.asset(
                Assets.imagesLogo,
                height: 150,
                width: 200,
              ),
              Container(
                width: 350.w,
                height: 650.h,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
                  SizedBox(height: 18.h),
                  Text(
                    'Sign Up Page',
                    style: TextStyles.medium24.copyWith(
                      color: AppColors.blue,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  CustomTextFieldWithLabel(
                    onSaved: (value) {
                      _email = value!;
                    },
                    label: 'Email or Phone',
                    hintText: 'Enter your email or phone number',
                    labelStyle: TextStyles.bold18,
                    hintStyle: TextStyles.light16,
                  ),
                  CustomTextFieldWithLabel(
                    onSaved: (value) {
                      _password = value!;
                    },
                    label: 'Password',
                    hintText: 'Enter your password',
                    labelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    isPasswordField: true,
                    controller: TextEditingController(),
                  ),
                  CustomTextFieldWithLabel(
                    label: 'Confirm Password',
                    hintText: 'Enter your password',
                    labelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    isPasswordField: true,
                    controller: TextEditingController(),
                  ),
                  CustomButtonWidget(
                    text: 'Sign Up',
                    width: 330,
                    height: 70,
                    backgroundColor: AppColors.green,
                    borderRadius: BorderRadius.circular(10),
                    textStyle: TextStyles.bold18.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        context
                            .read<SignUpCubit>()
                            .createUserWithEmailAndPassword(_email, _password);
                      } else {
                        setState(() {
                          _formAutovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  ),
                  SizedBox(height: 18.h),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Already have an account?',
                      style: TextStyles.medium18.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h),
                  CustomButtonWidget(
                    text: 'Sign In',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    width: 330,
                    height: 70,
                    backgroundColor: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    textStyle: TextStyles.bold18
                        .copyWith(fontSize: 20, color: Colors.blue),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
