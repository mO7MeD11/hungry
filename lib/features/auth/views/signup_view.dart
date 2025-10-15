import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:project/core/constants/app_colors.dart';
import 'package:project/shared/custom_button.dart';
import 'package:project/shared/custom_test_field.dart';
import 'package:project/shared/custom_text.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _LoginViewState();
}

class _LoginViewState extends State<SignupView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.kPColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(MediaQuery.of(context).size.height * .01),

                    SvgPicture.asset('assets/Hungry_.svg'),
                    Gap(10),

                    CustomTextField(
                      hint: 'name',
                      textController: nameController,
                    ),
                    Gap(10),
                    CustomTextField(
                      hint: 'Email',
                      textController: emailController,
                    ),
                    Gap(10),
                    CustomTextField(
                      hint: 'Password',
                      isPassword: true,
                      textController: passwordController,
                    ),
                    Gap(10),
                    CustomTextField(
                      hint: 'confirm password',
                      isPassword: true,
                      textController: confirmController,
                    ),
                    Gap(40),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: 'SignUp',
                        onTap: () {
                          if (formKey.currentState!.validate()) {}
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
