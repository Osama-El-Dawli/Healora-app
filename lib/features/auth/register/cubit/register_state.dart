import 'package:healora/features/auth/register/data/models/user_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final UserModel user;
  RegisterSuccess(this.user);
}

class RegisterFailure extends RegisterState {
  final String error;
  RegisterFailure(this.error);
}
