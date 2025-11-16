import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healora/core/cache/hive_manager.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/edit_account/cubit/update_account_info_state.dart';
import 'package:healora/features/edit_account/data/repositories/update_user_info_repository.dart';

class UpdateAccountCubit extends Cubit<UpdateAccountState> {
  final UpdateUserInfoRepository repository;
  final UserModel? userModel;

  UpdateAccountCubit(this.repository, {this.userModel})
    : super(UpdateAccountInitial());

  Future<void> updateAccount({
    String? firstName,
    String? lastName,
    String? phone,
    String? image,
  }) async {
    emit(UpdateAccountLoading());

    try {
      final oldFirstName = userModel?.firstName ?? '';
      final oldLastName = userModel?.lastName ?? '';
      final oldPhone = userModel?.phoneNumber ?? '';
      final oldImage = userModel?.imageUrl ?? '';

      final updatedUser = await repository.updateUserData(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        image: image,
      );

      List<String> updatedFields = [];
      if (firstName != null && firstName != oldFirstName) {
        updatedFields.add('first_name'.tr());
      }
      if (lastName != null && lastName != oldLastName) {
        updatedFields.add('last_name'.tr());
      }
      if (phone != null && phone != oldPhone) {
        updatedFields.add('phone_number'.tr());
      }
      if (image != null && image != oldImage) updatedFields.add('avatar'.tr());

      if (userModel != null) {
        userModel!.firstName = updatedUser.firstName;
        userModel!.lastName = updatedUser.lastName;
        userModel!.phoneNumber = updatedUser.phoneNumber;
        userModel!.imageUrl = updatedUser.imageUrl;

        await HiveManager.saveUser(userModel!);
      }

      String message;
      if (updatedFields.isEmpty) {
        message = 'no_changes_made'.tr();
      } else {
        message = updatedFields
            .map(
              (field) => 'updated_successfully'.tr(namedArgs: {'field': field}),
            )
            .join('\n');
      }

      emit(UpdateAccountSuccess(updatedUser, message: message));
    } catch (e) {
      emit(
        UpdateAccountError(
          'failed_to_update'.tr(namedArgs: {'error': e.toString()}),
        ),
      );
    }
  }
}
