import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.label,
  }) : super(key: key);
  final TextEditingController controller;
  final String hint;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '$label   ',
          style: TextStyles.bold18.copyWith(
            color: AppColors.black,
          ),
        ),
        Container(
          height: 36,
          width: 196,
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: controller,
            style: TextStyles.bold18.copyWith(
              color: AppColors.black,
            ),
            decoration: InputDecoration(
              alignLabelWithHint: true,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: hint,
              hintStyle: TextStyles.light16.copyWith(
                color: AppColors.grey,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 8,
              ),
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
