import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/widgets/custom_header.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/doctor_feature/presentation/widgets/patient_list_view.dart';
import 'package:healora/features/edit_account/cubit/update_account_info_cubit.dart';
import 'package:healora/features/edit_account/cubit/update_account_info_state.dart';

class DoctorScreenBody extends StatelessWidget {
  final UserModel user;

  const DoctorScreenBody({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            BlocBuilder<UpdateAccountCubit, UpdateAccountState>(
              builder: (context, state) {
                final updateUserCubit = context.read<UpdateAccountCubit>();
                final user = updateUserCubit.userModel;
                if (user == null) return const SizedBox();
                return CustomHeader(
                  user: user,
                  updateUserCubit: updateUserCubit,
                );
              },
            ),
            SizedBox(height: 8.h),
            Expanded(child: PatientListView(
              doctor: user,
            )),
          ],
        ),
      ),
    );
  }
}
