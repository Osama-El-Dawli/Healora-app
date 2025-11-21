import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/cache/hive_manager.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/loading_indicator.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/edit_account/cubit/update_account_info_cubit.dart';
import 'package:healora/features/edit_account/cubit/update_account_info_state.dart';
import 'package:healora/features/edit_account/presentation/widgets/edit_form_fields.dart';

class EditAccountForm extends StatelessWidget {
  const EditAccountForm({super.key, required UserModel user});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateAccountCubit, UpdateAccountState>(
      listener: (context, state) async {
        if (state is UpdateAccountLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => const LoadingIndicator(),
          );
        } else if (state is UpdateAccountSuccess) {
          if (Navigator.canPop(context)) Navigator.pop(context);
          Fluttertoast.showToast(
            msg: state.message.tr(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: AppColors.secondary,
            textColor: AppColors.backgroundColor,
            fontSize: 16.sp,
          );

          await HiveManager.saveUser(state.user);

          if (Navigator.canPop(context)) Navigator.pop(context, state.user);
        } else if (state is UpdateAccountError) {
          if (Navigator.canPop(context)) Navigator.pop(context);
          Fluttertoast.showToast(
            msg: state.message.tr(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: AppColors.red,
            textColor: AppColors.backgroundColor,
            fontSize: 16.sp,
          );
        }
      },
      builder: (context, state) {
        return const EditAccountFormFields();
      },
    );
  }
}
