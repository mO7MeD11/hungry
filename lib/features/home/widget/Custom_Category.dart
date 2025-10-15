import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_colors.dart';

class CustomCategory extends StatefulWidget {
  const CustomCategory({super.key});

  @override
  State<CustomCategory> createState() => _CustomCategoryState();
}

class _CustomCategoryState extends State<CustomCategory> {
  final List<String> category = ['All', 'Combos', 'Sliders', 'Classic'];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(category.length, (index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              setState(() {});
            },
            child: Container(
              margin: index != 0 ? EdgeInsets.only(left: 12) : null,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: currentIndex == index
                    ? AppColors.kPColor
                    : Colors.grey.shade200,
              ),
              child: Text(
                category[index],
                style: TextStyle(
                  color: currentIndex == index ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
