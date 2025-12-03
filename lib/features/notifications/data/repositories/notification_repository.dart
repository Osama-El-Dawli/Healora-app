import 'package:healora/features/notifications/data/data_sources/notification_remote_data_source.dart';
import 'package:healora/features/notifications/data/models/notification_model.dart';

abstract class NotificationRepository {
  Future<void> saveNotification(NotificationModel notification);
}

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource _remoteDataSource;

  NotificationRepositoryImpl(this._remoteDataSource);

  @override
  Future<void> saveNotification(NotificationModel notification) async {
    await _remoteDataSource.saveNotification(notification);
  }
}
