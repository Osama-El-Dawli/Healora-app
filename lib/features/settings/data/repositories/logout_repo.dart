import 'package:healora/features/settings/data/data_sources/firebase_logout_remote_data_source.dart';

class LogoutRepo {
  final FirebaseLogoutRemoteDataSource _remoteDataSource;

  LogoutRepo({required FirebaseLogoutRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  Future<void> logout({required String uid}) async {
    await _remoteDataSource.logout(uid: uid);
  }
}
