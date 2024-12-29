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
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Image.asset(
            Assets.imagesBarPlaneScreen,
            height: 171.h,
            width: 390.w,
          ),
          SizedBox(height: 41.h),
          Expanded(
            child: ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                return CustomWidgetListTile(
                  day: exercise.day,
                  exercise: exercise.exerciseName,
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
      ),
    );
  }
}

class CustomWidgetListTile extends StatelessWidget {
  final String day;
  final String exercise;
  final VoidCallback? onStartPressed;

  const CustomWidgetListTile({
    Key? key,
    required this.day,
    required this.exercise,
    required this.onStartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      height: 80.h,
      decoration: ShapeDecoration(
        color: AppColors.greencard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: ListTile(
        style: ListTileStyle.drawer,
        title: Text(
          day,
          style: TextStyles.bold32.copyWith(
            color: AppColors.white,
          ),
        ),
        subtitle: Text(
          exercise,
          style: TextStyles.bold16.copyWith(
            color: AppColors.white,
            fontSize: 16.sp,
          ),
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: onStartPressed == null
                ? Colors.grey
                : Colors.white, // تعطيل الزر عند القفل
            fixedSize: Size(108.w, 44.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: onStartPressed,
          child: Text(
            'Start',
            style: TextStyles.bold26.copyWith(
              color: onStartPressed == null
                  ? Colors.black54
                  : AppColors.greencard, // لون النص يتغير إذا كان الزر مقفلًا
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
