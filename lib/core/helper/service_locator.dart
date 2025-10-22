import 'package:get_it/get_it.dart';
import 'package:healora/features/chat/cubit/chat_cubit/chat_cubit.dart';
import 'package:healora/features/chat/data/data_sources/firestore_chat_remote_data_source.dart';
import 'package:healora/features/chat/data/repositories/chat_repo.dart';

abstract class ServiceLocator {
  static final getIt = GetIt.instance;

  void setup() {
    getIt.registerLazySingleton<FirestoreChatRemoteDataSource>(
      () => FirestoreChatRemoteDataSource(),
    );

    getIt.registerLazySingleton<ChatRepo>(
      () =>
          ChatRepo(firestoreDataSource: getIt<FirestoreChatRemoteDataSource>()),
    );

    getIt.registerLazySingleton<ChatCubit>(() => ChatCubit(getIt<ChatRepo>()));
  }
}
