import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/doctor_feature/data/models/patient_with_appointment.dart';
import 'package:healora/features/doctor_feature/presentation/widgets/appointment_details_screen_body.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  const AppointmentDetailsScreen({
    super.key,
    required this.patientWithAppointment,
    required this.doctor,
  });
  final PatientWithAppointment patientWithAppointment;
  final UserModel doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details'.tr()),
        centerTitle: false,
      ),
      body: AppointmentDetailsScreenBody(
        doctor: doctor,
        patientWithAppointment: patientWithAppointment,
      ),
    );
  }
}
