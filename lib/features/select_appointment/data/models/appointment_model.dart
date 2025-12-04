class AppointmentModel {
  final String? id;
  final String patientId;
  final String date;
  final String time;
  final String doctorId;

  AppointmentModel({
    this.id,
    required this.patientId,
    required this.date,
    required this.time,
    required this.doctorId,
  });

  factory AppointmentModel.fromFirebase(Map<String, dynamic> data, String id) {
    return AppointmentModel(
      id: id,
      patientId: data['patientId'],
      date: data['date'],
      time: data['time'],
      doctorId: data['doctorId'],
    );
  }

  Map<String, dynamic> toFirebase() => <String, dynamic>{
    'patientId': patientId,
    'date': date,
    'time': time,
    'doctorId': doctorId,
  };
}
