import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healora/core/cache/hive_manager.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/edit_account/cubit/update_account_info_state.dart';
import 'package:healora/features/edit_account/data/repositories/update_user_info_repository.dart';
import 'package:healora/features/edit_account/data/repositories/upload_profile_image_repo.dart';

class UpdateAccountCubit extends Cubit<UpdateAccountState> {
  final UpdateUserInfoRepository _infoRepo;
  final UploadProfileImageRepo _imageRepo;
  UserModel? userModel;

  UpdateAccountCubit(this._infoRepo, this._imageRepo, {this.userModel})
    : super(UpdateAccountInitial());

  Future<void> updateAccount({
    String? firstName,
    String? lastName,
    String? phone,
    File? image,
  }) async {
    emit(UpdateAccountLoading());

    try {
      String? imageUrl;

      if (image != null) {
        final fileName =
            '${userModel!.uid}_${DateTime.now().millisecondsSinceEpoch}';
        imageUrl = await _imageRepo.uploadProfileImage(
          imageFile: image,
          fileName: fileName,
        );
      }

      final oldFirstName = userModel?.firstName ?? '';
      final oldLastName = userModel?.lastName ?? '';
      final oldPhone = userModel?.phoneNumber ?? '';
      final oldImage = userModel?.imageUrl ?? '';

      final updatedUser = await _infoRepo.updateUserData(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        image: imageUrl,
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
      if (imageUrl != null && imageUrl != oldImage) {
        updatedFields.add('avatar'.tr());
      }

      if (userModel != null) {
        userModel!
          ..firstName = updatedUser.firstName
          ..lastName = updatedUser.lastName
          ..phoneNumber = updatedUser.phoneNumber
          ..imageUrl = updatedUser.imageUrl;

        await HiveManager.saveUser(userModel!);
        userModel = HiveManager.getUser();
        log(userModel!.imageUrl);
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
      log(e.toString());
      emit(
        UpdateAccountError(
          'failed_to_update'.tr(namedArgs: {'error': e.toString()}),
        ),
      );
    }
  }
}
