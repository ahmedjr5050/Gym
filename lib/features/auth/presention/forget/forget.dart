import 'package:fitflow/core/helper/build_error_bar.dart';
import 'package:fitflow/core/services/getit_services.dart';
import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/core/widgets/custom_button_widget.dart';
import 'package:fitflow/features/auth/data/repos/auth_repo_imp.dart';
import 'package:fitflow/features/auth/presention/cubits/forgetpassword/forgetpasswordcubit_cubit.dart';
import 'package:fitflow/features/auth/presention/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  static const String routeName = '/forget';

  @override
  Widget build(BuildContext context) {
    String _email = '';  // Initialize _email

    return BlocProvider(
      create: (context) => ForgetpasswordCubit(
        getIt<AuthRepoImpl>(),
      ),
      child: BlocConsumer<ForgetpasswordCubit, ForgetpasswordcubitState>(
        listener: (context, state) {
          if (state is ForgetpasswordcubitSuccess) {
            showBar(context, 'Password reset link sent to your email.');
            Navigator.pop(context);
          }
          if (state is ForgetpasswordcubitError) {
            String errorMessage = state.error;
            if (state.error.contains('channel-error')) {
              errorMessage = 'Network error, please check your connection and try again.';
            } else if (state.error.contains('email')) {
              errorMessage = 'Email could not be sent, please check your email configuration.';
            }
            showBar(context, errorMessage);
          }
        },
        builder: (context, state) {
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
                            onSaved: (value) {
                              _email = value ?? '';  // Initialize _email with saved value
                            },
                            keyboardType: TextInputType.emailAddress,
                            label: 'Enter Your Email',
                            hintText: 'Enter your email here',
                            labelStyle: TextStyles.bold18,
                            hintStyle: TextStyles.light16,
                          ),
                          state is ForgetpasswordcubitLoading
                              ? CircularProgressIndicator()  // Show loading indicator if state is loading
                              : CustomButtonWidget(
                                  text: 'Send',
                                  onPressed: () {
                                    context.read<ForgetpasswordCubit>().resetPassword(
                                          _email,
                                        );
                                  },
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
        },
      ),
    );
  }
}
