part of 'select_doctor_cubit.dart';

sealed class SelectDoctorState {}

final class SelectDoctorInitial extends SelectDoctorState {}

final class SelectDoctorLoading extends SelectDoctorState {}

final class SelectDoctorSuccess extends SelectDoctorState {
  final List<DoctorModel> doctors;
  SelectDoctorSuccess({required this.doctors});
}

final class SelectDoctorFailure extends SelectDoctorState {
  final String errorMessage;
  SelectDoctorFailure({required this.errorMessage});
}
