import 'package:flutter/material.dart';
import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonGoal extends StatelessWidget {
  const CustomButtonGoal({
    super.key,
    required this.pathimages,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  final String pathimages;
  final String title;
  final void Function() onTap;
  final bool isSelected; // Add a flag to indicate selection

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 162,
        width: 119,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected
              ? AppColors.grey
              : AppColors.green, // Use isSelected to set color
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(pathimages),
            SizedBox(height: 15.h),
            Text(
              title,
              style: TextStyles.bold16.copyWith(
                fontSize: 14,
                color: AppColors.white, // Adjust text color accordingly
              ),
            )
          ],
        ),
      ),
    );
  }
}
