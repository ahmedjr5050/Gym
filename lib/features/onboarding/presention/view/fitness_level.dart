import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/features/onboarding/presention/view/form_fit_flow.dart';
import 'package:flutter/material.dart';
import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/widgets/custom_button_widget.dart';
import 'package:fitflow/features/onboarding/presention/view/widegts/custom_button_goal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FitnessLevel extends StatefulWidget {
  const FitnessLevel({super.key});
  static const routeName = '/fitness_level';

  @override
  _FitnessLevelState createState() => _FitnessLevelState();
}

class _FitnessLevelState extends State<FitnessLevel> {
  String? _selectedLevel;

  void _selectLevel(String level) {
    setState(() {
      _selectedLevel = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 56.h),
          Image.asset('assets/images/Logo.png'),
          SizedBox(height: 60.h),
          Text(
            'What Is Your Level ?',
            style: TextStyles.bold26.copyWith(color: AppColors.white),
          ),
          SizedBox(height: 69.h),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonGoal(
                  title: 'Beginner',
                  pathimages: Assets.imagesBeginner,
                  onTap: () => _selectLevel('Beginner'),
                  isSelected:
                      _selectedLevel == 'Beginner', // Pass selection state
                ),
                CustomButtonGoal(
                  title: 'Intermediate',
                  pathimages: Assets.imagesIntermediate,
                  onTap: () => _selectLevel('Intermediate'),
                  isSelected:
                      _selectedLevel == 'Intermediate', // Pass selection state
                ),
                CustomButtonGoal(
                  title: 'Advanced',
                  pathimages: Assets.imagesAdvanced,
                  onTap: () => _selectLevel('Advanced'),
                  isSelected:
                      _selectedLevel == 'Advanced', // Pass selection state
                ),
              ],
            ),
          ),
          SizedBox(height: 103.h),
          CustomButtonWidget(
            text: 'NEXT',
            onPressed: _selectedLevel != null
                ? () {
                    Navigator.pushNamed(context, FormFitFlow.routeName); // Navigate to FormFitFlow.routeName);
                  }
                : null,
            width: 330,
            height: 70,
            backgroundColor:
                AppColors.white, // Change color to indicate disabled state
            borderRadius: BorderRadius.circular(10),
            textStyle: TextStyles.bold18.copyWith(
              fontSize: 20,
              color: AppColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
