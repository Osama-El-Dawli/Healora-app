part of 'lab_results_cubit.dart';

sealed class LabResultsState {}

final class LabResultsInitial extends LabResultsState {}

final class LabResultsLoading extends LabResultsState {}

final class LabResultsUpdated extends LabResultsState {}

final class LabResultsLoaded extends LabResultsState {
  final List<LabResultsModel> labResultsList;
  LabResultsLoaded({required this.labResultsList});
}

final class LabResultsAdded extends LabResultsState {}

final class LabResultsFailure extends LabResultsState {
  final String errorMessage;

  LabResultsFailure({required this.errorMessage});
}
