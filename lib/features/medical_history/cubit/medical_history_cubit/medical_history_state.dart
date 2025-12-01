part of 'medical_history_cubit.dart';

sealed class MedicalHistoryState {}

final class MedicalHistoryInitial extends MedicalHistoryState {}

final class MedicalHistoryLoading extends MedicalHistoryState {}

final class MedicalHistoryUpdated extends MedicalHistoryState {}

final class MedicalHistoryLoaded extends MedicalHistoryState {
  final List<MedicalHistoryModel> medicalHistoryList;
  MedicalHistoryLoaded({required this.medicalHistoryList});
}

final class MedicalHistoryAdded extends MedicalHistoryState {}

final class MedicalHistoryFailure extends MedicalHistoryState {
  final String errorMessage;

  MedicalHistoryFailure({required this.errorMessage});
}
