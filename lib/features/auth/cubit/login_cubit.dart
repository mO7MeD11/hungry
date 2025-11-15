import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/network/api_error.dart';
import 'package:project/features/auth/cubit/auth_state.dart';
import 'package:project/features/auth/data/auth_repo.dart';
import 'package:project/features/auth/data/user_model.dart';

class LoginCubit extends Cubit<AuthState> {
  LoginCubit() : super(InitialState());

  AuthRepo authRepo = AuthRepo();

  Future<void> login({required String email, required String password}) async {
    emit(LoadingState());
    try {
      final result = await authRepo.login(email, password);
      emit(SuccessState());
    } catch (e) {
      if (e is ApiError) {
        emit(ErrorState(message: e.message)); // ✅ نعرض رسالة الخطأ من ApiError
      } else {
        emit(ErrorState(message: e.toString())); // ✅ fallback
      }
    }
  }
}
