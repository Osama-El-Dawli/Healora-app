import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healora/features/edit_account/cubit/account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());
}
