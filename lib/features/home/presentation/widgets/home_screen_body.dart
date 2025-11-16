import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_profile_avatar.dart';
import 'package:healora/features/edit_account/cubit/update_account_info_cubit.dart';
import 'package:healora/features/edit_account/cubit/update_account_info_state.dart';
import 'package:healora/features/home/presentation/widgets/home_screen_list_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            BlocBuilder<UpdateAccountCubit, UpdateAccountState>(
              builder: (context, state) {
                final updateUserCubit = context.read<UpdateAccountCubit>();
                final user = updateUserCubit.userModel;
                debugPrint('HomeScreenBody user: ${user?.toMap()}');
                if (user == null) return const SizedBox();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '👋🏻 ${'Hi'.tr()} ${user.firstName}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(23.r),
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.settingsScreen,
                        arguments: user,
                      ),
                      child: CustomProfileAvatar(imageUrl: user.imageUrl),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 16.h),
            BlocBuilder<UpdateAccountCubit, UpdateAccountState>(
              builder: (context, state) {
                final updateUserCubit = context.read<UpdateAccountCubit>();
                final user = updateUserCubit.userModel;
                if (user == null) return const SizedBox();
                return Expanded(child: HomeScreenListView(user: user));
              },
            ),
          ],
        ),
      ),
    );
  }
}
