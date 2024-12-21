import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/features/profile/presention/view/palne_screen_view.dart';
import 'package:fitflow/features/profile/presention/view/widgets/cardio_news.dart';
import 'package:fitflow/features/profile/presention/view/widgets/news_plane_conatiner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsScreenViewBody extends StatelessWidget {
  const NewsScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 33.h),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PlaneScreen.routeName);
                },
                child: YourPlane()),
            SizedBox(height: 15.h),
            CardioNewsWidget(
              title: '5 Tips to Improve Your Cardio  Performance',
              subtitle:
                  'Discover how to increase endurance and enhance your cardio workouts with these simple tips',
              imagePath: Assets.imagesRun,
            ),
            SizedBox(height: 15.h),
            CardioNewsWidget(
              title: 'How to Stay Motivated on Your Fitness Journey',
              subtitle:
                  'Discover how to increase endurance and enhance your cardio workouts with these simple tips',
              imagePath: Assets.imagesPower,
            ),
            SizedBox(height: 15.h),
            CardioNewsWidget(
              title: 'The Best Post-Workout Meals for Muscle',
              subtitle:
                  'The Best Post-Workout Meals for Muscle Recovery Check out these nutritious meal ideas!',
              imagePath: Assets.imagesFood,
            ),
          ],
        ),
      ),
    );
  }
}
