import 'package:get_it/get_it.dart';
import 'package:healora/features/auth/login/data/data_sources/firebase_login_remote_datasource.dart';
import 'package:healora/features/auth/login/data/repositories/login_repository.dart';
import 'package:healora/features/auth/register/data/data_sources/firebase_register_remote_datasource.dart';
import 'package:healora/features/auth/register/data/repositories/register_repository.dart';
import 'package:healora/features/chat/data/data_sources/firestore_chat_remote_data_source.dart';
import 'package:healora/features/chat/data/repositories/chat_repo.dart';
import 'package:healora/features/edit_account/data/data_sources/supabase_upload_profile_image_remote_data_source.dart';
import 'package:healora/features/doctor_feature/data/data_sources/firebase_doctor_feature_remote_data_source.dart';
import 'package:healora/features/doctor_feature/data/repositories/doctor_feature_repo.dart';
import 'package:healora/features/edit_account/data/repositories/update_user_info_repository.dart';
import 'package:healora/features/edit_account/data/repositories/upload_profile_image_repo.dart';
import 'package:healora/features/lab_results/data/repositories/lab_results_repo.dart';
import 'package:healora/features/medical_chatbot/data/data_sources/gemini_remote_data_source.dart';
import 'package:healora/features/medical_chatbot/data/data_sources/gemini_service.dart';
import 'package:healora/features/medical_chatbot/data/repositories/chat_bot_repo.dart';
import 'package:healora/features/medical_history/data/data_sources/medical_history_firebase_data_source.dart';
import 'package:healora/features/medical_history/data/repositories/medical_history_repo.dart';
import 'package:healora/features/select_appointment/data/data_source/select_appointment_firebase_data_source.dart';
import 'package:healora/features/select_appointment/data/repository/appointment_repo.dart';
import 'package:healora/features/select_doctor/data/data_sources/firebase_select_doctor_remote_data_source.dart';
import 'package:healora/features/select_doctor/data/repositories/select_doctor_repo.dart';
import 'package:healora/features/settings/data/data_sources/firebase_logout_remote_data_source.dart';
import 'package:healora/features/settings/data/repositories/logout_repo.dart';
import 'package:healora/features/lab_results/data/data_sources/lab_results_firebase_data_source.dart';

class ServiceLocator {
  static final getIt = GetIt.instance;

  static void setup() {
    // Chat Feature
    getIt.registerLazySingleton<FirestoreChatRemoteDataSource>(
      () => FirestoreChatRemoteDataSource(),
    );
    getIt.registerLazySingleton<ChatRepo>(
      () =>
          ChatRepo(firestoreDataSource: getIt<FirestoreChatRemoteDataSource>()),
    );

    // Login Feature
    getIt.registerLazySingleton<FirebaseLoginRemoteDatasource>(
      () => FirebaseLoginRemoteDatasource(),
    );
    getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepository(dataSource: getIt<FirebaseLoginRemoteDatasource>()),
    );

    // Register Feature
    getIt.registerLazySingleton<FirebaseRegisterRemoteDataSource>(
      () => FirebaseRegisterRemoteDataSource(),
    );
    getIt.registerLazySingleton<RegisterRepository>(
      () => RegisterRepository(
        dataSource: getIt<FirebaseRegisterRemoteDataSource>(),
      ),
    );

    // ChatBot Feature
    getIt.registerLazySingleton<GeminiRemoteDataSource>(
      () => GeminiRemoteDataSource(),
    );
    getIt.registerLazySingleton<GeminiService>(
      () => GeminiService(getIt<GeminiRemoteDataSource>()),
    );
    getIt.registerLazySingleton<ChatBotRepo>(
      () => ChatBotRepo(geminiService: getIt<GeminiService>()),
    );

    // Select Doctor Feature
    getIt.registerLazySingleton<FirebaseSelectDoctorRemoteDataSource>(
      () => FirebaseSelectDoctorRemoteDataSource(),
    );
    getIt.registerLazySingleton<SelectDoctorRepo>(
      () => SelectDoctorRepo(
        dataSource: getIt<FirebaseSelectDoctorRemoteDataSource>(),
      ),
    );

    // Medical History Feature
    getIt.registerLazySingleton<MedicalHistoryFirebaseDataSource>(
      () => MedicalHistoryFirebaseDataSource(),
    );
    getIt.registerLazySingleton<MedicalHistoryRepo>(
      () => MedicalHistoryRepo(
        dataSource: getIt<MedicalHistoryFirebaseDataSource>(),
      ),
    );

    // Lab Results Feature
    getIt.registerLazySingleton<LabResultsFirebaseDataSource>(
      () => LabResultsFirebaseDataSource(),
    );
    getIt.registerLazySingleton<LabResultsRepo>(
      () => LabResultsRepo(dataSource: getIt<LabResultsFirebaseDataSource>()),
    );

    // Select Appointment Feature
    getIt.registerLazySingleton<SelectAppointmentFirebaseDataSource>(
      () => SelectAppointmentFirebaseDataSource(),
    );
    getIt.registerLazySingleton<AppointmentRepo>(
      () => AppointmentRepo(
        dataSource: getIt<SelectAppointmentFirebaseDataSource>(),
      ),
    );

    // settings Feature
    getIt.registerLazySingleton<FirebaseLogoutRemoteDataSource>(
      () => FirebaseLogoutRemoteDataSource(),
    );
    getIt.registerLazySingleton<LogoutRepo>(
      () =>
          LogoutRepo(remoteDataSource: getIt<FirebaseLogoutRemoteDataSource>()),
    );
    getIt.registerLazySingleton<UpdateUserInfoRepository>(
      () => UpdateUserInfoRepository(),
    );
    getIt.registerLazySingleton<SupabaseUploadProfileImageRemoteDataSource>(
      () => SupabaseUploadProfileImageRemoteDataSource(),
    );
    getIt.registerLazySingleton<UploadProfileImageRepo>(
      () => UploadProfileImageRepo(
        dataSource: getIt<SupabaseUploadProfileImageRemoteDataSource>(),
      ),
    );

    // Doctor Feature
    getIt.registerLazySingleton<FirebaseDoctorFeatureRemoteDataSource>(
      () => FirebaseDoctorFeatureRemoteDataSource(),
    );
    getIt.registerLazySingleton<DoctorFeatureRepo>(
      () => DoctorFeatureRepo(
        dataSource: getIt<FirebaseDoctorFeatureRemoteDataSource>(),
      ),
    );
  }
}
