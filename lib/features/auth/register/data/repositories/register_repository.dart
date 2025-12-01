import 'package:healora/features/auth/register/data/data_sources/firebase_register_remote_datasource.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';

class RegisterRepository {
  final FirebaseRegisterRemoteDataSource dataSource;
  RegisterRepository({required this.dataSource});
  Future<UserModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
    required String specialization,
  }) async {
    try {
      final user = await dataSource.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        role: role,
        specialization: specialization,
      );

      return user;
    } catch (e) {
      throw Exception('Registration failed: ${e.toString()}');
    }
  }

  Future<void> saveDeviceToken({required String userId}) async {
    try {
      await dataSource.saveDeviceToken(userId: userId);
    } catch (e) {
      rethrow;
    }
  }
}
