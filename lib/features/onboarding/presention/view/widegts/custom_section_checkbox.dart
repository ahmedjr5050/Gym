
import 'package:fitflow/features/onboarding/presention/view/widegts/custom_checkbox.dart';
import 'package:flutter/material.dart';

class CustomSectionCheckbox extends StatefulWidget {
  final String labelsOne;
  final String labelsTwo;

  const CustomSectionCheckbox({
    Key? key,
    required this.labelsOne,
    required this.labelsTwo,
  }) : super(key: key);

  @override
  _CustomSectionCheckboxState createState() => _CustomSectionCheckboxState();
}

class _CustomSectionCheckboxState extends State<CustomSectionCheckbox> {
  String? selectedLabel;

  void _handleSelection(String label) {
    setState(() {
      selectedLabel = label;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
          label: widget.labelsOne,
          value: selectedLabel == widget.labelsOne,
          onChanged: (isChecked) {
            _handleSelection(widget.labelsOne);
          },
          activeColor: Colors.green,
        ),
        SizedBox(width: 20),
        CustomCheckbox(
          label: widget.labelsTwo,
          value: selectedLabel == widget.labelsTwo,
          onChanged: (isChecked) {
            _handleSelection(widget.labelsTwo);
          },
          activeColor: Colors.green,
        ),
      ],
    );
  }
}
