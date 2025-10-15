import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/core/constants/app_colors.dart';
import 'package:project/features/auth/views/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginView();
          },
        ),
      );
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .25),
            SvgPicture.asset('assets/Hungry_.svg'),
            Spacer(),
            Image.asset('assets/splash.png'),
          ],
        ),
      ),
    );
  }
}
