import 'package:healora/features/auth/register/data/models/user_model.dart';

abstract class UpdateAccountState {}

class UpdateAccountInitial extends UpdateAccountState {}

class UpdateAccountLoading extends UpdateAccountState {}

class UpdateAccountSuccess extends UpdateAccountState {
  final UserModel user;
  final String message;

  UpdateAccountSuccess(this.user, {required this.message});
}

class UpdateAccountError extends UpdateAccountState {
  final String message;

  UpdateAccountError(this.message);
}
