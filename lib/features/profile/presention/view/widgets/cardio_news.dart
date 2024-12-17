import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CardioNews extends StatelessWidget {
  const CardioNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 392,
      height: 460,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF007AFF)),
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesRun),
            SizedBox(
              height: 18,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '5 Tips to Improve Your Cardio  Performance\n',
                    style: TextStyles.bold16,
                  ),
                  TextSpan(text: '\n'),
                  TextSpan(
                    text: 'Discover how to increase endurance and enhance\n',
                  ),
                  TextSpan(text: 'your cardio workouts with these simple tips'),
                ],
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Read More',
                  style: TextStyles.regular14.copyWith(
                    color: AppColors.blue,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.blue,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
