import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medicare/models/pill.dart';
import '../../widgets/medicine_card.dart';

class MedicinesList extends StatelessWidget {
  final List<Pill> listOfMedicines;
  final Function setData;
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  const MedicinesList(this.listOfMedicines, this.setData, {super.key});
  // const MedicinesList(
  //     this.listOfMedicines, this.setData, this.flutterLocalNotificationsPlugin, {super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          MedicineCard(listOfMedicines[index], setData),
      // itemBuilder: (context, index) => MedicineCard(
      //     listOfMedicines[index], setData, flutterLocalNotificationsPlugin),
      itemCount: listOfMedicines.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
