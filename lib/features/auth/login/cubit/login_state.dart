import 'package:healora/features/auth/register/data/models/user_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserModel user;
  LoginSuccess({required this.user});
}

class LoginFailure extends LoginState {
  final String? emailError;
  final String? passwordError;
  final String? generalError;

  LoginFailure({this.emailError, this.passwordError, this.generalError});
}
