import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:healora/core/notifications/send_notification_service.dart';
import 'package:healora/features/doctor_feature/data/models/patient_with_appointment.dart';
import 'package:healora/features/doctor_feature/data/repositories/doctor_feature_repo.dart';
import 'package:healora/features/select_appointment/data/models/appointment_model.dart';

part 'doctor_feature_state.dart';

class DoctorFeatureCubit extends Cubit<DoctorFeatureState> {
  DoctorFeatureCubit(this._repo) : super(DoctorFeatureInitial());
  final DoctorFeatureRepo _repo;
  Future<void> fetchBookedPatients({required String doctorId}) async {
    emit(DoctorFeatureLoading());
    try {
      final appointments = await _repo.getBookedPatients(doctorId: doctorId);
      emit(DoctorFeatureSuccess(appointments: appointments));
    } catch (e) {
      emit(DoctorFeatureFailure(errorMessage: e.toString()));
    }
  }

  Future<void> updateAppointment({
    required AppointmentModel appointment,
  }) async {
    emit(DoctorFeatureLoading());
    try {
      await _repo.updateAppointment(appointment: appointment);

      log('Fetching patient token for: ${appointment.patientId}');
      final token = await _repo.getPatientToken(
        patientId: appointment.patientId,
      );
      log('Patient token: $token');

      if (token != null) {
        log('Sending notification...');
        await sendNotification(
          token: token,
          title: 'Appointment Rescheduled',
          body:
              'Your appointment has been rescheduled to ${appointment.date} at ${appointment.time}',
          data: {
            'type': 'appointment_reschedule',
            'appointmentId': appointment.id ?? '',
          },
        );
        log('Notification sent');
      } else {
        log('Token is null, notification not sent');
      }

      await fetchBookedPatients(doctorId: appointment.doctorId);
    } catch (e) {
      log(e.toString());
      emit(DoctorFeatureFailure(errorMessage: e.toString()));
    }
  }
}
