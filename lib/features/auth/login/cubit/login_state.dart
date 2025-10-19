abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String uid;
  LoginSuccess(this.uid);
}

class LoginFailure extends LoginState {
  final String? emailError;
  final String? passwordError;
  final String? generalError; 

  LoginFailure({this.emailError, this.passwordError, this.generalError});
}
