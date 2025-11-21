part of 'doctor_feature_cubit.dart';

sealed class DoctorFeatureState {}

final class DoctorFeatureInitial extends DoctorFeatureState {}

final class DoctorFeatureLoading extends DoctorFeatureState {}

final class DoctorFeatureSuccess extends DoctorFeatureState {
  final List<PatientWithAppointment> appointments;

  DoctorFeatureSuccess({required this.appointments});
}

final class DoctorFeatureFailure extends DoctorFeatureState {
  final String errorMessage;

  DoctorFeatureFailure({required this.errorMessage});
}
