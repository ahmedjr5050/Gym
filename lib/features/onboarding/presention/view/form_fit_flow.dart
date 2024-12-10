// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/onboarding/presention/view/widegts/custom_formfield_profile.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';

class FormFitFlow extends StatelessWidget {
  const FormFitFlow({super.key});
  static const routeName = '/form_fit_flow';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesLogo, height: 150, width: 150),
              CustomFormFieldProfile(),
            ],
          ),
        ),
      ),
    );
  }
}
