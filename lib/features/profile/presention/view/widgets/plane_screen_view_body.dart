import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class PlaneScreeenViewBody extends StatelessWidget {
  const PlaneScreeenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(Assets.imagesBarPlaneScreen),
          CustomWidgetListTile(),
        ],
      ),
    );
  }
}

class CustomWidgetListTile extends StatelessWidget {
  const CustomWidgetListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        style: ListTileStyle.drawer,
        title: Text(
          'Day 1',
          style: TextStyles.bold32.copyWith(
            color: AppColors.white,
          ),
        ),
        subtitle: Text(
          'chest',
          style: TextStyles.bold16.copyWith(
            color: AppColors.white,
          ),
        ),
        tileColor: Colors.green,
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            fixedSize: const Size(108, 44),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Start',
            style: TextStyles.bold26.copyWith(
              color: AppColors.green,
              fontSize: 24,
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
