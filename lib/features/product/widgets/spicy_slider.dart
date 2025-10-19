import 'package:flutter/material.dart';
import 'package:project/core/constants/app_colors.dart';

class SpicySlider extends StatelessWidget {
  const SpicySlider({super.key, required this.onChanged, required this.value});
  final Function(double) onChanged;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/pngwing12.png',
          width: 150,
          height: 240,
          fit: BoxFit.fill,
        ),
        Spacer(),
        Column(
          children: [
            SizedBox(
              width: 150,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Customize',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' Your Burger to Your Tastes. Ultimate Experience',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            Slider(
              value: value,
              onChanged: onChanged,
              min: 0,
              max: 1,
              inactiveColor: AppColors.kPColor,
              activeColor: AppColors.kPColor,
            ),

            Row(children: [Text('🥶'), SizedBox(width: 80), Text('🌶️')]),
          ],
        ),
      ],
    );
  }
}
