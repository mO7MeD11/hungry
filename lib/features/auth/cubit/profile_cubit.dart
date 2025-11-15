import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/network/api_error.dart';
import 'package:project/features/auth/cubit/auth_state.dart';
import 'package:project/features/auth/data/auth_repo.dart';

class ProfileCubit extends Cubit<AuthState> {
  ProfileCubit() : super(InitialState());

  AuthRepo authRepo = AuthRepo();
  bool x = true;

  Future<void> getUserdata() async {
    try {
      emit(LoadingState());
      final user = await authRepo.getProfileData();
      emit(SuccessState(userModel: user));
    } catch (e) {
      if (e is ApiError) {
        emit(ErrorState(message: e.message)); // ✅ نعرض رسالة الخطأ من ApiError
      } else {
        emit(ErrorState(message: e.toString())); // ✅ fallback
      }
    }
  }
}
