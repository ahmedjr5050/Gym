import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/core/widgets/custom_button_widget.dart';
import 'package:fitflow/features/auth/presention/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fitflow/features/auth/presention/forget/forget.dart';
import 'package:fitflow/features/auth/presention/signup_view.dart';
import 'package:fitflow/features/auth/presention/widgets/custom_textformfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: _formAutovalidateMode,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Image.asset(Assets.imagesLogo, height: 200, width: 200),
              Container(
                width: 330.w,
                height: 520.h,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 18.h),
                      Text(
                        'Sign In Page',
                        style: TextStyles.medium24.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                      SizedBox(height: 37.h),
                      CustomTextFieldWithLabel(
                        onSaved: (value) {
                          _email = value!;
                        },
                        label: 'Email or Phone',
                        hintText: 'Enter your email or phone number',
                        labelStyle: TextStyles.bold18,
                        hintStyle: TextStyles.light16,
                      ),
                      // SizedBox(height: 5.h),
                      CustomTextFieldWithLabel(
                        onSaved: (value) {
                          _password = value!;
                        },
                        label: 'Password',
                        hintText: 'Enter your password',
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        isPasswordField: true,
                        controller: TextEditingController(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ForgetPassword.routeName);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text('Forgot Password?',
                                style: TextStyles.light16.copyWith(
                                  color: AppColors.accent,
                                )),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      CustomButtonSignIn(),
                      SizedBox(height: 10.h),
                      Text(
                        'Or',
                        style: TextStyles.medium18.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      FlutterSocialButton(
                        iconSize: 18,
                        title: 'Sign In with Google',

                        onTap: () {
                          print('google');
                          context.read<SignInCubit>().signInWithGoogle();
                          // Navigator.pushNamed(context, NewsScreenView.routeName);
                        },
                        titleStyle: TextStyles.bold18.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        buttonType: ButtonType
                            .google, // Button type for different type buttons
                        iconColor: Colors.redAccent, // for change icons colors
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
AutovalidateMode _formAutovalidateMode = AutovalidateMode.disabled;
late String _email, _password;

class CustomButtonSignIn extends StatefulWidget {
  const CustomButtonSignIn({
    super.key,
  });

  @override
  State<CustomButtonSignIn> createState() => _CustomButtonSignInState();
}

class _CustomButtonSignInState extends State<CustomButtonSignIn> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButtonWidget(
          width: 150,
          height: 70,
          backgroundColor: AppColors.green,
          borderRadius: BorderRadius.circular(10),
          text: 'Sign In',
          textStyle: TextStyles.bold18.copyWith(
            fontSize: 20,
            color: Colors.white,
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              context
                  .read<SignInCubit>()
                  .signInWithEmailAndPassword(_email, _password);
            } else {
              setState(() {
                _formAutovalidateMode = AutovalidateMode.always;
              });
            }
          },
        ),
        CustomButtonWidget(
          width: 150,
          height: 70,
          backgroundColor: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          text: 'Sign Up',
          textStyle: TextStyles.bold18.copyWith(
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pushNamed(context, SignUpView.routeName);
          },
        ),
      ],
    );
  }
}
