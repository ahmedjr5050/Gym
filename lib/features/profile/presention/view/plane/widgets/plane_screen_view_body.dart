import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/features/profile/presention/view/plane/widgets/chest_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/models_exervises.dart';

class PlaneScreenViewBody extends StatefulWidget {
  const PlaneScreenViewBody({Key? key}) : super(key: key);

  @override
  State<PlaneScreenViewBody> createState() => _PlaneScreenViewBodyState();
}

class _PlaneScreenViewBodyState extends State<PlaneScreenViewBody> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Image.asset(
          Assets.imagesBarPlaneScreen,
          height: 171.h,
          width: 390.w,
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              final exercise = exercises[index];
              return ExerciseCard(
                exercise: exercise,
                onStartPressed: exercise.isLocked
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChestView(
                              imagePath: exercise.imagePath,
                              exerciseName: exercise.exerciseName,
                              reps: exercise.reps,
                              muscleTargeted: exercise.muscleTargeted,
                              appBarName: exercise.exerciseName,
                            ),
                          ),
                        );
                      },
              );
            },
          ),
        ),
      ],
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback? onStartPressed;

  const ExerciseCard({
    Key? key,
    required this.exercise,
    required this.onStartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.greencard,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            exercise.day,
            style: TextStyles.bold32.copyWith(color: AppColors.white),
          ),
          Text(
            exercise.exerciseName,
            style: TextStyles.bold16.copyWith(color: AppColors.white),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  onStartPressed == null ? Colors.grey : Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: onStartPressed,
            child: Text(
              'Start',
              style: TextStyles.bold16.copyWith(
                color: onStartPressed == null
                    ? Colors.black54
                    : AppColors.greencard,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
