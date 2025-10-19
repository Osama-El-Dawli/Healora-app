import 'package:healora/features/auth/login/data/data_sources/firebase_login_remote_datasource.dart';

class LoginRepository {
  final FirebaseLoginRemoteDatasource dataSource;
  LoginRepository({required this.dataSource});
  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final uid = await dataSource.login(email: email, password: password);
      return uid;
    } catch (e) {
      rethrow;
    }
  }
}
