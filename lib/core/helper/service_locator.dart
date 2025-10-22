import 'package:get_it/get_it.dart';
import 'package:healora/features/auth/login/cubit/login_cubit.dart';
import 'package:healora/features/auth/login/data/data_sources/firebase_login_remote_datasource.dart';
import 'package:healora/features/auth/login/data/repositories/login_repository.dart';
import 'package:healora/features/auth/register/cubit/register_cubit.dart';
import 'package:healora/features/auth/register/data/data_sources/firebase_register_remote_datasource.dart';
import 'package:healora/features/auth/register/data/repositories/register_repository.dart';
import 'package:healora/features/chat/cubit/chat_cubit/chat_cubit.dart';
import 'package:healora/features/chat/data/data_sources/firestore_chat_remote_data_source.dart';
import 'package:healora/features/chat/data/repositories/chat_repo.dart';

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
    getIt.registerFactory<ChatCubit>(() => ChatCubit(getIt<ChatRepo>()));

    // Login Feature
    getIt.registerLazySingleton<FirebaseLoginRemoteDatasource>(
      () => FirebaseLoginRemoteDatasource(),
    );
    getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepository(dataSource: getIt<FirebaseLoginRemoteDatasource>()),
    );
    getIt.registerFactory<LoginCubit>(
      () => LoginCubit(getIt<LoginRepository>()),
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
    getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(getIt<RegisterRepository>()),
    );
  }
}
