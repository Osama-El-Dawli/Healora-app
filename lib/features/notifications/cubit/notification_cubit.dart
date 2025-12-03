import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/notifications/data/models/notification_model.dart';
import 'package:healora/features/notifications/data/repositories/notification_repository.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._notificationRepository)
    : super(NotificationInitial());
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

  Future<void> handleNotificationTap(Map<String, dynamic> data) async {
    if (data.containsKey('chatId') && data.containsKey('senderId')) {
      final chatId = data['chatId'];
      final otherUserId = data['senderId'];

      try {
        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser == null) return;

        final otherUser = await _notificationRepository.getUser(otherUserId);
        final currentUserModel = await _notificationRepository.getUser(
          currentUser.uid,
        );

        if (otherUser != null && currentUserModel != null) {
          final currentNotifications = state is NotificationSuccess
              ? (state as NotificationSuccess).notifications
              : <NotificationModel>[];

          emit(
            NotificationNavigateToChat(
              chatId: chatId,
              otherUser: otherUser,
              currentUser: currentUserModel,
              notifications: currentNotifications,
            ),
          );
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
