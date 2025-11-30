import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/select_appointment/data/models/appointment_model.dart';

class PatientWithAppointment {
  final UserModel patient;
  final AppointmentModel appointment;

  PatientWithAppointment({
    required this.patient,
    required this.appointment,
  });
}