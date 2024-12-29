import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/features/profile/presention/view/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChestView extends StatelessWidget {
  final String imagePath;
  final String exerciseName;
  final String reps;
  final String muscleTargeted;
  final String appBarName;
  const ChestView({
    Key? key,
    required this.imagePath,
    required this.exerciseName,
    required this.reps,
    required this.muscleTargeted,
    required this.appBarName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        imagePath: Assets.imagesFitFlowlogo,
        titleText: appBarName,
      ),
      backgroundColor: AppColors.primaryColor, // تحديد اللون الأزرق كخلفية
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 370.h,
              width: 400.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(imagePath),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                exerciseName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.sp,
                ),
              ),
              Text(
                reps,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                height: 1,
                width: 399.w,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Muscle targeted: $muscleTargeted',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
