import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/select_appointment/data/models/appointment_model.dart';
import 'package:healora/features/select_appointment/presentation/widgets/booking_details_screen_body.dart';
import 'package:healora/features/select_doctor/data/models/doctor_model.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({
    super.key,
    required this.appointment,
    required this.doctor,
    required this.patient,
  });
  final AppointmentModel appointment;
  final DoctorModel doctor;
  final UserModel patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('booking_details'.tr())),
      body: BookingDetailsScreenBody(
        doctor: doctor,
        appointment: appointment,
        patient: patient,
      ),
    );
  }
}
