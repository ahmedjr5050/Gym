import 'package:flutter/material.dart';

class CustomTextFieldWithLabel extends StatefulWidget {
  final String label;
  final String hintText;
  final TextStyle labelStyle;
  final TextStyle hintStyle;
  final TextEditingController? controller;
  final EdgeInsetsGeometry padding;
  final Widget? suffixIcon;
  final bool isPasswordField;
final TextInputType? keyboardType;
  const CustomTextFieldWithLabel({
    Key? key,
    required this.label,
    required this.hintText,
    required this.labelStyle,
    required this.hintStyle,
    this.suffixIcon,
    this.controller,
    this.padding = const EdgeInsets.all(13.0),
    this.isPasswordField = false, this.keyboardType,
  }) : super(key: key);

  @override
  State<CustomTextFieldWithLabel> createState() =>
      _CustomTextFieldWithLabelState();
}

class _CustomTextFieldWithLabelState extends State<CustomTextFieldWithLabel> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.label,
              style: widget.labelStyle,
            ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            obscureText: widget.isPasswordField && !_isPasswordVisible,
            decoration: InputDecoration(
              suffixIcon: widget.isPasswordField
                  ? IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    )
                  : widget.suffixIcon,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
