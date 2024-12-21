import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String imagePath;
  final String titleText;
final double size;
  const CustomAppBar({
    super.key,
    this.size = 32,
    required this.imagePath,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      bottomOpacity: 4,
      shadowColor: AppColors.primaryColor,
      backgroundColor: AppColors.primaryColor,
      toolbarHeight: 105,
      title: Row(
        children: [
          Image.asset(
            imagePath,
            height: 129,
            width: 70,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 20),
          Text(
            titleText,
            style: TextStyles.bold32.copyWith(
              color: AppColors.white,
              fontSize: size,
            ),
          ),
        ],
      ),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(105);
}
