import 'package:baity_task/src/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SelectingField extends StatelessWidget {
  const SelectingField({
    super.key,
    required this.text,
    required this.isSelected,
  });
  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[300],
        border: isSelected == true
            ? Border.all(color: Colors.blue, width: 2)
            : null,
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Text(
            text,
            style: Styles.regularStyle16(context).copyWith(color: Colors.black),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey[500],
          )
        ],
      ),
    );
  }
}
