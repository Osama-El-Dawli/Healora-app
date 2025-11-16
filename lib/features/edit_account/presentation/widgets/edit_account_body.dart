import 'package:flutter/material.dart';

import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/edit_account/presentation/widgets/edit_account_form.dart';

class EditAccountBody extends StatelessWidget {
  const EditAccountBody({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: EditAccountForm());
  }
}
