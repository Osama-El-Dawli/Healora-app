part of 'appointment_cubit.dart';

sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

final class AppointmentLoading extends AppointmentState {}

final class AppointmentBooking extends AppointmentState {}

final class AppointmentSuccess extends AppointmentState {
  final AppointmentModel appointmentModel;

  AppointmentSuccess({required this.appointmentModel});
}

final class AppointmentFailure extends AppointmentState {
  final String errorMessage;
  AppointmentFailure({required this.errorMessage});
}

final class AppointmentTimesLoaded extends AppointmentState {
  final List<String> times;
  AppointmentTimesLoaded({required this.times});
}

final class AppointmentCancelled extends AppointmentState {}
