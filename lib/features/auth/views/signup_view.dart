import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:project/core/constants/app_colors.dart';
import 'package:project/features/auth/cubit/auth_state.dart';
import 'package:project/features/auth/cubit/signup_cubit.dart';
import 'package:project/shared/custom_button.dart';
import 'package:project/shared/custom_test_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _LoginViewState();
}

class _LoginViewState extends State<SignupView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Gap(150),
                  SvgPicture.asset(
                    'assets/Hungry_.svg',
                    color: AppColors.kPColor,
                  ),
                  Gap(50),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.kPColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Gap(MediaQuery.of(context).size.height * .01),

                              Gap(30),

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
                                hint: 'phone',
                                textController: phoneController,
                              ),

                              Gap(40),
                              BlocListener<SignupCubit, AuthState>(
                                listener: (context, state) {
                                  if (state is LoadingState) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Row(
                                          children: [
                                            Text('loading '),
                                            CupertinoActivityIndicator(),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else if (state is SuccessState) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Success! login now ',
                                        ),
                                      ),
                                    );
                                    Navigator.pop(context);
                                  } else if (state is ErrorState) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(state.message)),
                                    );
                                  }
                                },
                                child: SizedBox(
                                  width: double.infinity,
                                  child: CustomButton(
                                    text: 'SignUp',
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        BlocProvider.of<SignupCubit>(
                                          context,
                                        ).Signup(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          phone: phoneController.text,
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
                                    'already have an account ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Gap(10),

                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'login',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
