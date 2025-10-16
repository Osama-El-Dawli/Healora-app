import 'package:flutter/material.dart';
import 'package:healora/core/routes/routes.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/custom_medical_history.dart';

class MedicalHistoryScreen extends StatefulWidget {
  const MedicalHistoryScreen({super.key});

  @override
  State<MedicalHistoryScreen> createState() => _MedicalHistoryScreenState();
}

class _MedicalHistoryScreenState extends State<MedicalHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(

      ),
      body:
      ListView(
         children: [Column(
           children: [
             SizedBox(
               width: size.width,
               height: 150,
               child: Container(
                 margin: EdgeInsets.all(16),
                 padding: EdgeInsets.all(8),
                 decoration: BoxDecoration(
                   color:AppColors.gray,
                   borderRadius: BorderRadius.circular(16),
                 ),
                 child: Row(
                   children: [
                     Text("medical history",
                       style: TextStyle(fontSize: 30,color: AppColors.primary),),
                     Image.asset("assets/images/home_page1.png"),
                   ],
                 ),
               ),
             ),
             Container(
               margin: EdgeInsets.all(16),
               padding:EdgeInsets.all(16) ,
               decoration: BoxDecoration(
                 color: AppColors.gray,
                 borderRadius: BorderRadius.circular(16)
               ),
               child: GridView.builder(
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 crossAxisSpacing: 10,
                 mainAxisSpacing: 10,
                 childAspectRatio: 1.2,
               ),
               itemCount: 12,
               itemBuilder: (context, index) {
                 return CustomMedicalHistory(
                   date: DateTime.now().subtract(Duration(days: index)),
                 );
               },
             ),

    )


           ],

         ),]
      ),
      floatingActionButton: FloatingActionButton
        (onPressed: () {  },
        child: Icon(Icons.add),),
    );
  }
}
