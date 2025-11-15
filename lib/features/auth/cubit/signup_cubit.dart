import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/network/api_error.dart';
import 'package:project/features/auth/cubit/auth_state.dart';
import 'package:project/features/auth/data/auth_repo.dart';
 
class SignupCubit extends Cubit<AuthState> {
  SignupCubit( ) :super(InitialState()) ;

  final AuthRepo _authRepo = AuthRepo();

 Future<  void> Signup (  {
    required String name,
    required String email,
    required String password,
    required String phone,
  })async {
    
    try {
         emit(LoadingState());
  await _authRepo.signup(
    name: name,
    email: email,
    password: password,
    phone: phone,
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
