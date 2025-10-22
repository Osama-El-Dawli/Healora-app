import 'package:healora/features/auth/login/data/data_sources/firebase_login_remote_datasource.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';

class LoginRepository {
  final FirebaseLoginRemoteDatasource _dataSource;
  LoginRepository({required FirebaseLoginRemoteDatasource dataSource})
    : _dataSource = dataSource;
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _dataSource.login(email: email, password: password);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
