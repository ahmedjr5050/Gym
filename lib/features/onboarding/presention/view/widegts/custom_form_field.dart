import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.hint,
    required this.onSaved,
    required this.label,
    this.validator,
    this.keyboardType,
  }) : super(key: key);
  final void Function(String?)? onSaved;
  final String hint;
  final String label;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '$label   ',
            style: TextStyles.bold18.copyWith(
              color: AppColors.black,
            ),
          ),
          Container(
            width: 200,
            height: 60,
            child: TextFormField(
              validator: validator,
              keyboardType: keyboardType,
              onSaved: onSaved,
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
                  horizontal: 10,
                ),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
