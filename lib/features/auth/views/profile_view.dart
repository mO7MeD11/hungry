import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:project/core/constants/app_colors.dart';
import 'package:project/core/network/api_service.dart';
import 'package:project/features/auth/cubit/auth_state.dart';
import 'package:project/features/auth/cubit/logout_cubit.dart';
import 'package:project/features/auth/cubit/profile_cubit.dart';
import 'package:project/features/auth/cubit/update_cubit.dart';
import 'package:project/features/auth/data/user_model.dart';
import 'package:project/features/auth/views/login_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (BlocProvider.of<ProfileCubit>(context).x) {
        BlocProvider.of<ProfileCubit>(context).getUserdata();
        BlocProvider.of<ProfileCubit>(context).x = false;

        WidgetsBinding.instance.addPostFrameCallback((_) {});
      }
    });
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocBuilder<ProfileCubit, AuthState>(
          builder: (context, state) {
            final UserModel? user = state is SuccessState
                ? state.userModel
                : null;
            if (user != null) {
              nameController.text = user.name;
              emailController.text = user.email;
              addressController.text = user.address ?? '';
            }

            return RefreshIndicator(
              onRefresh: () async {
                await BlocProvider.of<ProfileCubit>(context).getUserdata();
              },
              child: Skeletonizer(
                enabled: state is LoadingState,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
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
                      Gap(8),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text('edit image'),
                        ),
                      ),

                      Gap(30),
                      CustomTextField(
                        labelText: 'Name',
                        content: user?.name ?? ' ',
                        controller: nameController,
                      ),
                      Gap(15),
                      CustomTextField(
                        labelText: 'email',
                        content: user?.email ?? ' ',
                        controller: emailController,
                      ),
                      Gap(15),
                      CustomTextField(
                        labelText: 'address',
                        content: user?.address ?? ' ',
                        controller: addressController,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomSheet: CustomBottomSheet(
        name: nameController,
        email: emailController,
        address: addressController,
      ),
    );
  }
}

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
    required this.name,
    required this.email,
    required this.address,
  });

  final TextEditingController? name;
  final TextEditingController? email;
  final TextEditingController? address;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
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
            BlocConsumer<UpdateCubit, AuthState>(
              listener: (context, state) {
                if (state is ErrorState) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                } else if (state is SuccessState) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('success')));
                }
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return CupertinoActivityIndicator();
                }

                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.kPColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<UpdateCubit>(context).updateProfile(
                        name: widget.name!.text,
                        email: widget.email!.text,
                        address: widget.address!.text,
                      );
                      log('message');
                    },
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
                );
              },
            ),
            Spacer(),
              BlocConsumer <LogoutCubit, AuthState>(
                builder:  (context, state) {
                if (state is LoadingState) {
                  return CupertinoActivityIndicator();
                } else if (state is ErrorState) {
                } 
                return InkWell(
                  onTap: () {
                    BlocProvider.of<LogoutCubit>(context).logout();
                  },
                  child: Container(
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
                          style: TextStyle(
                            color: AppColors.kPColor,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.logout, color: AppColors.kPColor),
                      ],
                    ),
                  ),
                );
              }, listener: (BuildContext context, AuthState state) {  
                 if (state is SuccessState) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                } },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.content,
    required this.controller,
  });
  final String labelText;
  final String content;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      controller: controller,
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
