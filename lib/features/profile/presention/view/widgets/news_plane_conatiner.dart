
import 'package:fitflow/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourPlane extends StatelessWidget {
  const YourPlane({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 114,
      padding:
          const EdgeInsets.only(top: 5, left: 21, right: 79, bottom: 9),
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 149,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesImageNews),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 19),
          Text(
            'Your Plan',
            style: TextStyle(
              color: Color(0xFF007AFF),
              fontSize: 26,
              fontFamily: 'Roboto Slab',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
