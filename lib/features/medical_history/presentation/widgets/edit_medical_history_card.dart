import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/core/widgets/custom_text_form_field.dart';

import '../../data/models/medical_history_card_model.dart';

class EditMedicalHistoryCard extends StatelessWidget {
  final MedicalHistoryModel model;
  const EditMedicalHistoryCard({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Medical history card",)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: Column(
              children: [
                CustomTextFormField(
                  initialValue: model.title,
                  hintText: "Title",
                  onChanged: (text){
                    model.title=text;
                  },
                ),
                SizedBox(height: 10,),
                CustomTextFormField(
                  initialValue: model.description,
                  hintText: "Description",
                  onChanged: (text){
                    model.description=text;
                  },
                ),
                Spacer(),
                CustomElevatedButton(label: "Save", onPressed: (){
                  Navigator.of(context).pop(model);
                },color: AppColors.secondary,)
              ],
            ),
          ),
        )
    );
  }
}
