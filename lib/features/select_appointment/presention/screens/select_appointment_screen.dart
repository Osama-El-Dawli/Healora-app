import 'package:flutter/material.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/select_appointment/presention/widgets/doctor_info.dart';
import 'package:healora/features/select_appointment/presention/widgets/select_date.dart';
import 'package:healora/features/select_appointment/presention/widgets/select_time.dart';

import '../../../../core/routes/routes.dart';

class SelectAppointmentScreen extends StatelessWidget {
  List<SelectDate> dates=[
    SelectDate(),
    SelectDate(),
    SelectDate(),
    SelectDate(),
    SelectDate(),
    SelectDate(),
    SelectDate(),
  ];
  List<SelectTime> time=[
    SelectTime(text: "8:00"),
    SelectTime(text: "8:30"),
    SelectTime(text: "9:00"),
    SelectTime(text: "9:30"),
    SelectTime(text: "10:00"),
    SelectTime(text: "10:30"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Appointment"),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          DoctorInfo(name: "mariam", specialty: "teeth", image: "profile"),
          SizedBox(height: 20,),
          Text("Select date",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.black),),
            SizedBox(height: 15,),
            Row(
              children: [
                Icon(Icons.arrow_back_ios_new),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height*.1,
                    child: ListView.separated(separatorBuilder: (_,index)=>SizedBox(width: 10,),
                        itemBuilder: (_,index)=>dates[index],
                      itemCount: dates.length,
                      scrollDirection: Axis.horizontal,),
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
            SizedBox(height: 20,),
            Text("Available Times on Oct 27,2025",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.black),),
            SizedBox(height: 15,),
            Expanded(
              child: GridView.builder(gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                mainAxisExtent: MediaQuery.sizeOf(context).height*.07,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10

              ),
                  itemBuilder: (_,index)=>time[index],
              itemCount: time.length,),
            ),
            ElevatedButton(onPressed: (){},
                child: Text("Book"))
          ],),
      ),
    );
  }
}
