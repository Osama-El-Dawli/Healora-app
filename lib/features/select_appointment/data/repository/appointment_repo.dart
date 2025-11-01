import 'package:healora/features/select_appointment/data/data_source/select_appointment_firebase_data_source.dart';
import 'package:healora/features/select_appointment/data/models/appointment_model.dart';

class AppointmentRepo {
  final SelectAppointmentFirebaseDataSource _dataSource;

  AppointmentRepo({required SelectAppointmentFirebaseDataSource dataSource})
    : _dataSource = dataSource;

  Future<void> bookAppointment({required AppointmentModel appointment}) async {
    await _dataSource.bookAppointment(appointment: appointment);
  }

  Future<List<String>> getAvailableTimes({
    required String day,
    required String docId,
  }) async {
    return await _dataSource.getAvailableTimes(day: day, docId: docId);
  }

  Future<AppointmentModel?> isBooked({
    required String docId,
    required String patientId,
  }) async {
    return await _dataSource.isBooked(docId: docId, patientId: patientId);
  }

  Future<void> cancelAppointment({
    required String patientId,
    required String docId,
  }) async {
    await _dataSource.cancelAppointment(patientId: patientId, docId: docId);
  }
}
