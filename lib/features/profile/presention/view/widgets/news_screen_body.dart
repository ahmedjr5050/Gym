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
            YourPlane(),
            SizedBox(height: 15.h),
            CardioNews(),
          ],
        ),
      ),
    );
  }
}
