import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/network/api_error.dart';
import 'package:project/features/auth/cubit/auth_state.dart';
import 'package:project/features/auth/data/auth_repo.dart';

class UpdateCubit extends Cubit<AuthState> {
  UpdateCubit() : super(InitialState());

  AuthRepo authRepo = AuthRepo();

     

  Future<void> updateProfile({
    String? name,
    String? email,
    String? address,
  }) async {
    emit(LoadingState());
    try {
      final result = await authRepo.updateProfileData(
        name: name,
        address: address,
        email: email,
      );
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
