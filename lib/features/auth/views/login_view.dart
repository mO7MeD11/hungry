import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:project/core/constants/app_colors.dart';
import 'package:project/features/auth/views/signup_view.dart';
import 'package:project/shared/custom_button.dart';
import 'package:project/shared/custom_test_field.dart';
import 'package:project/shared/custom_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
                    CustomText(
                      text: 'welcome back , discover the fast food',
                      color: Colors.white,
                      size: 16,
                      weight: FontWeight.w600,
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
                    Gap(40),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: 'login',
                        onTap: () {
                          if (formKey.currentState!.validate()) {}
                        },
                      ),
                    ),

                    Gap(10),

                    Row(
                      children: [
                        Text('don\'t have an account '),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignupView();
                                },
                              ),
                            );
                          },
                          child: Text('register'),
                        ),
                      ],
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
