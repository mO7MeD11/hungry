import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project/core/constants/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: AppColors.kPColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Gap(50),
            Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.white),
                ),
              ],
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/sonik.png',

                height: 150,
                width: 150,
                fit: BoxFit.fill,
              ),
            ),
            Gap(30),
            CustomTextField(labelText: 'Name'),
            Gap(15),
            CustomTextField(labelText: 'email'),
            Gap(15),
            CustomTextField(labelText: 'address'),
          ],
        ),
      ),
      bottomSheet: CustomBottomSheet(),
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.kPColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    'edit profile',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Spacer(),
                  Icon(Icons.edit, color: Colors.white),
                ],
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.kPColor),
              ),
              child: Row(
                children: [
                  Text(
                    'Logout',
                    style: TextStyle(color: AppColors.kPColor, fontSize: 16),
                  ),
                  Spacer(),
                  Icon(Icons.logout, color: AppColors.kPColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.labelText});
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
