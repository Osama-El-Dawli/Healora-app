import 'package:bloc/bloc.dart';
import 'package:healora/features/notifications/data/models/notification_model.dart';
import 'package:healora/features/notifications/data/repositories/notification_repository.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._notificationRepository) : super(NotificationInitial());
  final NotificationRepository _notificationRepository;

  Future<void> getNotifications() async {
    emit(NotificationLoading());
    try {
      final notifications = await _notificationRepository.getNotifications();
      emit(NotificationSuccess(notifications: notifications));
    } catch (e) {
      emit(NotificationFailure(errorMessage: e.toString()));
    }
  }
}
