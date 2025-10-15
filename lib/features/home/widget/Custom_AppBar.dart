import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:project/core/constants/app_colors.dart';
import 'package:project/shared/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/Hungry_.svg',
                color: AppColors.kPColor,
                width: 200,
              ),
              Gap(5),
              CustomText(
                text: 'Hello, Rich Sonic',
                color: Colors.grey.shade600,
                size: 18,
                weight: FontWeight.w500,
              ),
            ],
          ),
          Spacer(),
          ClipOval(child: Image.asset('assets/sonik.png')),
        ],
      ),
    );
  }
}
