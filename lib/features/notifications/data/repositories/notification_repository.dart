import 'package:healora/features/notifications/data/data_sources/notification_remote_data_source.dart';
import 'package:healora/features/notifications/data/models/notification_model.dart';

class NotificationRepository {
  final NotificationRemoteDataSource _remoteDataSource;
  NotificationRepository({
    required NotificationRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  Future<void> saveNotification(NotificationModel notification) async {
    await _remoteDataSource.saveNotification(notification);
  }

  Future<List<NotificationModel>> getNotifications() async {
    return await _remoteDataSource.getNotifications();
  }
}
