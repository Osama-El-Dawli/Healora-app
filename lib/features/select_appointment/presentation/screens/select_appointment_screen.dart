import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/select_appointment/presentation/widgets/select_appointment_screen_body.dart';
import 'package:healora/features/select_doctor/data/models/doctor_model.dart';

class SelectAppointmentScreen extends StatelessWidget {
  const SelectAppointmentScreen({
    super.key,
    required this.doctorModel,
    required this.patientModel,
  });
  final DoctorModel doctorModel;
  final UserModel patientModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book Appointment".tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: SelectAppointmentScreenBody(doctorModel: doctorModel, patientModel: patientModel,),
    );
  }
}
