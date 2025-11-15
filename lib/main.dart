import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/utils/pref_helper.dart';
import 'package:project/features/auth/cubit/login_cubit.dart';
import 'package:project/features/auth/cubit/logout_cubit.dart';
import 'package:project/features/auth/cubit/profile_cubit.dart';
import 'package:project/features/auth/cubit/signup_cubit.dart';
import 'package:project/features/auth/cubit/update_cubit.dart';
import 'package:project/features/auth/data/auth_repo.dart';
import 'package:project/features/auth/views/login_view.dart';
import 'package:project/root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthRepo authRepo = AuthRepo();
  bool currentUser = false;

  Future<void> checkLogin() async {
    bool x = await authRepo.autoLogin();

    currentUser = x;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => UpdateCubit()),
        BlocProvider(create: (context) => LogoutCubit()),
      ],

      child: MaterialApp(
        theme: ThemeData(splashColor: Colors.transparent),
        debugShowCheckedModeBanner: false,
        home: currentUser ? Root() : LoginView(),
      ),
    );
  }
}
