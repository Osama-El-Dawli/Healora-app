import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healora/core/cache/hive_manager.dart';
import 'package:healora/features/auth/register/cubit/register_state.dart';
import 'package:healora/features/auth/register/data/repositories/register_repository.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository registerRepository;

  RegisterCubit(this.registerRepository) : super(RegisterInitial());

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
    required String specialization,
  }) async {
    emit(RegisterLoading());
    try {
      final user = await registerRepository.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        role: role,
        specialization: specialization,
      );
      HiveManager.saveUser(user);
      emit(RegisterSuccess(user));
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
