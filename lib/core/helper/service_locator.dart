import 'package:get_it/get_it.dart';
import 'package:healora/features/auth/login/data/data_sources/firebase_login_remote_datasource.dart';
import 'package:healora/features/auth/login/data/repositories/login_repository.dart';
import 'package:healora/features/auth/register/data/data_sources/firebase_register_remote_datasource.dart';
import 'package:healora/features/auth/register/data/repositories/register_repository.dart';
import 'package:healora/features/chat/data/data_sources/firestore_chat_remote_data_source.dart';
import 'package:healora/features/chat/data/repositories/chat_repo.dart';
import 'package:healora/features/medical_chatbot/data/data_sources/gemini_remote_data_source.dart';
import 'package:healora/features/medical_chatbot/data/data_sources/gemini_service.dart';
import 'package:healora/features/medical_chatbot/data/repositories/chat_bot_repo.dart';

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

    // ChatBot
    getIt.registerLazySingleton<GeminiRemoteDataSource>(
      () => GeminiRemoteDataSource(),
    );
    getIt.registerLazySingleton<GeminiService>(
      () => GeminiService(getIt<GeminiRemoteDataSource>()),
    );
    getIt.registerLazySingleton<ChatBotRepo>(
      () => ChatBotRepo(geminiService: getIt<GeminiService>()),
    );
  }
}
