import 'package:bloc/bloc.dart';
import 'package:healora/features/select_appointment/data/models/appointment_model.dart';
import 'package:healora/features/select_appointment/data/repository/appointment_repo.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit(this._repo) : super(AppointmentInitial());

  final AppointmentRepo _repo;

  Future<void> bookAppointment({required AppointmentModel appointment}) async {
    emit(AppointmentBooking());
    try {
      await _repo.bookAppointment(appointment: appointment);
      emit(AppointmentSuccess(appointmentModel: appointment));
    } catch (e) {
      emit(AppointmentFailure(errorMessage: e.toString()));
    }
  }

  Future<void> getAvailableTimes({
    required String day,
    required String docId,
  }) async {
    emit(AppointmentLoading());
    try {
      final times = await _repo.getAvailableTimes(day: day, docId: docId);
      emit(AppointmentTimesLoaded(times: times));
    } catch (e) {
      emit(AppointmentFailure(errorMessage: e.toString()));
    }
  }

  Future<AppointmentModel?> isBookedBefore({
    required String docId,
    required String patientId,
  }) async {
    try {
      return await _repo.isBooked(docId: docId, patientId: patientId);
    } catch (e) {
      return null;
    }
  }

  Future<void> cancelAppointment({
    required String patientId,
    required String docId,
  }) async {
    emit(AppointmentLoading());
    try {
      await _repo.cancelAppointment(patientId: patientId, docId: docId);
      emit(AppointmentCancelled());
    } catch (e) {
      emit(AppointmentFailure(errorMessage: e.toString()));
    }
  }
}
