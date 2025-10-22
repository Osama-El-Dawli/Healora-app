import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healora/features/auth/login/cubit/login_state.dart';
import 'package:healora/features/auth/login/data/repositories/login_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repository;
  LoginCubit(this.repository) : super(LoginInitial());
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final user = await repository.login(email: email, password: password);
      emit(LoginSuccess(user: user));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        emit(LoginFailure(generalError: 'invalid_email_or_password'.tr()));
      } else if (e.code == 'too-many-requests') {
        emit(LoginFailure(generalError: 'too_many_requests'.tr()));
      } else if (e.code == 'channel_error') {
        emit(LoginFailure(generalError: 'channel_error'.tr()));
      } else if (e.code == 'network-request-failed') {
        emit(LoginFailure(generalError: 'network_error'.tr()));
      } else {
        emit(LoginFailure(generalError: 'unknown_error'.tr()));
      }
    }
  }
}
