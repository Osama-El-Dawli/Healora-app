import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healora/features/select_appointment/data/models/appointment_model.dart';

class SelectAppointmentFirebaseDataSource {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  Future<void> bookAppointment({required AppointmentModel appointment}) async {
    await _firebase
        .collection('appointments')
        .doc()
        .set(appointment.toFirebase());
  }

  Future<List<String>> getAvailableTimes({
    required String day,
    required String docId,
  }) async {
    final List<String> allTimes = [
      '8:00',
      '8:30',
      '9:00',
      '9:30',
      '10:00',
      '10:30',
    ];

    final bookedAppointments = await _getBookedAppointment(
      docId: docId,
      day: day,
    );

    final bookedTimes = bookedAppointments.map((e) => e.time).toList();

    final availableTimes =
        allTimes.where((t) => !bookedTimes.contains(t)).toList()
          ..sort((a, b) => a.compareTo(b));

    return availableTimes;
  }

  Future<List<AppointmentModel>> _getBookedAppointment({
    required String docId,
    required String day,
  }) async {
    final appointments = await _firebase
        .collection('appointments')
        .where('doctorId', isEqualTo: docId)
        .where('date', isEqualTo: day)
        .get();

    return appointments.docs
        .map((e) => AppointmentModel.fromFirebase(e.data(), e.id))
        .toList();
  }

  Future<AppointmentModel?> isBooked({
    required String docId,
    required String patientId,
  }) async {
    final appointments = await _firebase
        .collection('appointments')
        .where('doctorId', isEqualTo: docId)
        .where('patientId', isEqualTo: patientId)
        .get();

    if (appointments.docs.isEmpty) {
      return null;
    }

    return AppointmentModel.fromFirebase(
      appointments.docs.first.data(),
      appointments.docs.first.id,
    );
  }

  Future<void> cancelAppointment({
    required String patientId,
    required String docId,
  }) async {
    await _firebase
        .collection('appointments')
        .where('patientId', isEqualTo: patientId)
        .where('doctorId', isEqualTo: docId)
        .get()
        .then((value) => value.docs.first.reference.delete());
  }
}
