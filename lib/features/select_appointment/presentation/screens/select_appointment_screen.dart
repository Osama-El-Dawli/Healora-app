import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healora/features/select_appointment/presentation/widgets/select_appointment_screen_body.dart';

class SelectAppointmentScreen extends StatelessWidget {
  const SelectAppointmentScreen({super.key});
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
      body: SelectAppointmentScreenBody(),
    );
  }
}
