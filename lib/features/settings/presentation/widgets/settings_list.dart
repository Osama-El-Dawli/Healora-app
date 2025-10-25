import 'package:flutter/material.dart';
import 'package:healora/core/routes/routes.dart';

import 'package:healora/features/settings/presentation/widgets/settings_item.dart';

class SettingsList extends StatefulWidget {
  const SettingsList({super.key});

  @override
  State<SettingsList> createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsItem(
          onpressed: () {
            Navigator.pushNamed(context, AppRoutes.editAccountScreen);
          },
          icon: Icons.person,
          title: 'account',
          leading: Icon(Icons.arrow_forward_ios),
        ),

        SettingsItem(
          onpressed: () {
            Navigator.pushNamed(context, AppRoutes.notificationsScreen);
          },
          icon: Icons.notifications,
          title: 'notifications',
          leading: Icon(Icons.arrow_forward_ios),
        ),

        SettingsItem(
          onpressed: () {},
          icon: Icons.dark_mode,
          title: 'dark_mode',
          leading: Switch(
            value: isDark,
            onChanged: (bool value) {
              setState(() {
                isDark = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
