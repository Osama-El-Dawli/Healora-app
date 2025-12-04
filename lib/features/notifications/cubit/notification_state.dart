part of 'notification_cubit.dart';

sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationSuccess extends NotificationState {
  final List<NotificationModel> notifications;

  NotificationSuccess({required this.notifications});
}

final class NotificationFailure extends NotificationState {
  final String errorMessage;

  NotificationFailure({required this.errorMessage});
}

final class NotificationNavigateToChat extends NotificationState {
  final String chatId;
  final UserModel otherUser;
  final UserModel currentUser;
  final List<NotificationModel> notifications;

  NotificationNavigateToChat({
    required this.chatId,
    required this.otherUser,
    required this.currentUser,
    required this.notifications,
  });
}
