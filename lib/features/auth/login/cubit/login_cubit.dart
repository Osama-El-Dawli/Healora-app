import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healora/features/auth/login/cubit/login_state.dart';
import 'package:healora/features/auth/login/data/repositories/login_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repository;
  LoginCubit(this.repository) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final uid = await repository.login(email: email, password: password);
      emit(LoginSuccess(uid));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
