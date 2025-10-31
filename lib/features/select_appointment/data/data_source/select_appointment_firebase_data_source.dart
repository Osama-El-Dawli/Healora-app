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

    List<String> availableTimes = List.from(allTimes);

    final bookedAppointments = await _getBookedAppointment(docId: docId);

    for (AppointmentModel item in bookedAppointments) {
      if (item.date == day) {
        availableTimes.remove(item.time);
      }
    }

    availableTimes.sort((a, b) => a.compareTo(b));

    return availableTimes;
  }

  Future<List<AppointmentModel>> _getBookedAppointment({
    required String docId,
  }) async {
    final appointments = await _firebase
        .collection('appointments')
        .where('doctorId', isEqualTo: docId)
        .get();
    return appointments.docs
        .map((e) => AppointmentModel.fromFirebase(e.data()))
        .toList();
  }
}
