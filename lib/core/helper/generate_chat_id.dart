String generateChatId({required String doctorId, required String patientId}) {
  if (doctorId.compareTo(patientId) < 0) {
    return '${doctorId}_$patientId';
  } else {
    return '${patientId}_$doctorId';
  }
}
