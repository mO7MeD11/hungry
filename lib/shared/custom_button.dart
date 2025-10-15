import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/shared/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap});
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: CustomText(
            text: text,
            color: Colors.black,
            size: 16,
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
