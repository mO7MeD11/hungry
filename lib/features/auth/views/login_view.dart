import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:project/core/constants/app_colors.dart';
import 'package:project/features/auth/cubit/auth_state.dart';
import 'package:project/features/auth/cubit/login_cubit.dart';
import 'package:project/features/auth/views/signup_view.dart';
import 'package:project/root.dart';
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
                    BlocListener<LoginCubit, AuthState>(
                      listener: (context, state) {
                        if (state is ErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        } else if (state is SuccessState) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('success')));

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Root();
                              },
                            ),
                          );
                        } else if (state is LoadingState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  Text('loading'),
                                  CupertinoActivityIndicator(
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          text: 'login',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context).login(
                                email: emailController.text,
                                password: passwordController.text       ,
                              );
                            }
                          },
                        ),
                      ),
                    ),

                    Gap(10),

                    Row(
                      children: [
                        Text(
                          'don\'t have an account ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Gap(10),

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
                          child: Text(
                            'register',
                            style: TextStyle(color: Colors.red),
                          ),
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
