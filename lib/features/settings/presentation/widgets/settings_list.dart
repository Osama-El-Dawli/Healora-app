import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/theme/cubit/theme_cubit.dart';
import 'package:healora/core/theme/cubit/theme_state.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/edit_account/cubit/update_account_info_cubit.dart';

import 'package:healora/features/settings/presentation/widgets/settings_item.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key, required this.user, required this.updateAccountCubit});
  final UserModel user;
  final UpdateAccountCubit updateAccountCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(24.r),
          splashColor: AppColors.suffixIconColor.withValues(alpha: 0.2),
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.editAccountScreen,
            arguments: {
              'user': user,
              'cubit': updateAccountCubit,
            },
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 8.w),
            child: SettingsItem(
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.editAccountScreen,
                arguments: user,
              ),
              icon: Icons.person,
              title: 'account',
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(24.r),
          splashColor: AppColors.suffixIconColor.withValues(alpha: 0.1),
          onTap: () =>
              Navigator.pushNamed(context, AppRoutes.notificationsScreen),
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 8.w),
            child: SettingsItem(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.notificationsScreen),
              icon: Icons.notifications,
              title: 'notifications',
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 8.w),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              final isDark = state is DarkThemeState;
              return SettingsItem(
                icon: Icons.dark_mode,
                title: 'dark_mode',
                trailing: Switch(
                  value: isDark,
                  onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
