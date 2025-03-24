import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/features/profile/presention/view/widgets/couston_conatiner_data_excerices.dart';
import 'package:fitflow/features/profile/presention/view/widgets/customappbar.dart';
import 'package:fitflow/features/profile/presention/view/widgets/data_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardioExercises extends StatelessWidget {
  const CardioExercises({
    Key? key,
    required this.title,
    required this.predictedDiet,
    required this.excerciesname,
    required this.imageassets,
  }) : super(key: key);

  final String title; 
  final String predictedDiet; 
  final String excerciesname;
  final String imageassets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        imagePath: Assets.imagesFitFlowlogo,
        titleText: title,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: DataLoader().loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            Map<String, dynamic> data = snapshot.data!;
            var diet = data[excerciesname]?[predictedDiet];

            if (diet != null) {
              // معالجة أنواع البيانات المختلفة
              String vegetables;
              if (diet is String) {
                vegetables = diet; // إذا كانت نص
              } else if (diet is List) {
                vegetables = diet.join(', '); // إذا كانت قائمة
              } else if (diet is Map) {
                vegetables = diet.entries
                    .map((entry) => '${entry.key}: ${entry.value}')
                    .join(', '); // إذا كانت خريطة
              } else {
                vegetables = 'Invalid data format'; // إذا كان نوع غير متوقع
              }

              return Column(
                children: [
                  SizedBox(height: 33.h),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 350.w,
                      height: 561,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: ContainerData(
                          diet: vegetables,
                          imageassets: imageassets,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  const BackButtonWidget(),
                ],
              );
            } else {
              return const Center(child: Text('No data available.'));
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 72.h,
        width: 350.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.keyboard_double_arrow_left,
              size: 33,
            ),
            SizedBox(width: 8.w),
            Text(
              'Back to news Page',
              style: TextStyles.medium18.copyWith(
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
