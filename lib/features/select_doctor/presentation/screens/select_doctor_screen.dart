import 'package:flutter/material.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/features/select_doctor/presentation/widgets/select_doctor_item.dart';

import '../../../../core/theme/app_colors.dart';

class SelectDoctorScreen extends StatelessWidget {
  static const String routeName = AppRoutes.selectDoctorScreen;
List<DoctorItem> doctors=[
DoctorItem(name: "mariam", specialty: "teeth", icon: Icons.message, image: "profile"),
  DoctorItem(name: "mariam", specialty: "teeth", icon: Icons.message, image: "profile"),
  DoctorItem(name: "mariam", specialty: "teeth", icon: Icons.message, image: "profile"),
  DoctorItem(name: "mariam", specialty: "teeth", icon: Icons.message, image: "profile"),
  DoctorItem(name: "mariam", specialty: "teeth", icon: Icons.message, image: "profile"),

];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Text("Choose a doctor",
                  style: Theme.of(context).textTheme.titleLarge,),
                Image.asset("assets/images/home_page3.png",
                  width: MediaQuery.sizeOf(context).width*.3,)
              ],),
            ),
            Expanded(
              child: ListView.separated(separatorBuilder: (_,index)=>SizedBox(height: 10,),
                itemBuilder: (_,index)=>doctors[index]
                ,itemCount: doctors.length,),
            ),
          ],
        ),
      ),
    );
  }
}
