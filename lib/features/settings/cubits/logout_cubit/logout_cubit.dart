import 'package:bloc/bloc.dart';
import 'package:healora/features/settings/data/repositories/logout_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._repo) : super(LogoutInitial());

  final LogoutRepo _repo;

  Future<void> logout({required String uid}) async {
    emit(LogoutLoading());
    try {
      await _repo.logout(uid: uid);
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure(errorMessage: e.toString()));
    }
  }
}
