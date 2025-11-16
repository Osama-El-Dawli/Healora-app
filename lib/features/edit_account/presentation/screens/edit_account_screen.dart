import 'package:flutter/material.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/edit_account/presentation/widgets/edit_account_body.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Account')),
      body: SafeArea(child: EditAccountBody(user: user)),
    );
  }
}
