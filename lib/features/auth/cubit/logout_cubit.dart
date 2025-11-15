import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/auth/cubit/auth_state.dart';
import 'package:project/features/auth/data/auth_repo.dart';

class LogoutCubit extends Cubit<AuthState> {
  LogoutCubit() : super(InitialState());

  AuthRepo authRepo = AuthRepo();

  void logout() {
    try {
      emit(LoadingState());
      authRepo.logout();

      emit(SuccessState());
    } on Exception catch (e) {
      emit(ErrorState(message: 'there was ane error'));
    }
  }
}
