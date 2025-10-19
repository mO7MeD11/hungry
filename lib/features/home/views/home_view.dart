import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project/features/home/widget/Custom_AppBar.dart';
import 'package:project/features/home/widget/Custom_Category.dart';
import 'package:project/features/home/widget/Custom_Product.dart';
import 'package:project/features/home/widget/Custom_Search.dart';
 

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Gap(40),
              CustomAppBar(),
              Gap(20),
              CustomSearch(),
              Gap(20),
              CustomCategory(),
              Gap(20),
              Expanded(child: CustomProducts()),
            ],
          ),
        ),
      ),
    );
  }
}