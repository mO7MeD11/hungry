import 'package:project/features/auth/data/user_model.dart';

class AuthState {}

class InitialState extends AuthState {}

class LoadingState extends AuthState {}

class SuccessState extends AuthState {
  final UserModel? userModel;

  SuccessState({this.userModel});
}

class ErrorState extends AuthState {
  final String message;

  ErrorState({required this.message});
}

class activation extends AuthState {}
