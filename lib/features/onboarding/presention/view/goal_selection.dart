import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/core/widgets/custom_button_widget.dart';
import 'package:fitflow/features/onboarding/presention/view/fitness_level.dart';
import 'package:fitflow/features/onboarding/presention/view/widegts/custom_button_goal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalSelection extends StatefulWidget {
  const GoalSelection({super.key});
  static const routeName = '/goal-selection';

  @override
  State<GoalSelection> createState() => _GoalSelectionState();
}

class _GoalSelectionState extends State<GoalSelection> {
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
          SizedBox(
            height: 56.h,
          ),
          Image.asset('assets/images/Logo.png'),
          SizedBox(height: 60.h),
          Text(
            'What Is Your Goal?',
            style: TextStyles.bold26.copyWith(
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 69.h),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonGoal(
                  title: 'Muscle Gain',
                  pathimages: Assets.imagesMusclegain,
                  onTap: () {
                    _selectLevel('Muscle Gain');
                  },
                  isSelected: _selectedLevel == 'Muscle Gain',
                ),
                CustomButtonGoal(
                  isSelected: _selectedLevel == 'Weight Loss',
                  title: 'Weight Loss',
                  pathimages: Assets.imagesWeightLossicon,
                  onTap: () {
                    _selectLevel('Weight Loss');
                  },
                ),
                CustomButtonGoal(
                  isSelected: _selectedLevel == 'General Health',
                  title: 'General Health',
                  pathimages: Assets.imagesGeneralHealthicon,
                  onTap: () {
                    _selectLevel('General Health');
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 103.h),
          CustomButtonWidget(
            text: 'NEXT',
            onPressed: _selectedLevel != null
                ? () {
                    Navigator.pushNamed(context, FitnessLevel.routeName);
                  }
                : null, // Disable button if no level is selected
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
