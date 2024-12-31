import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerData extends StatelessWidget {
  const ContainerData({
    super.key,
    required this.diet,
    required this.imageassets,
  });
  final String diet;
  final String imageassets;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            clipBehavior: Clip.antiAlias,
            width: 331,
            height: 298,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageassets),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            width: 324,
            height: 19,
            child: Text(
              'Tips to Improve Your Cardio  Performance',
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            diet,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 14.sp,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
