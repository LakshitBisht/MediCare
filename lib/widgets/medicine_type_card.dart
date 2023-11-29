import 'package:flutter/material.dart';
import 'package:medicare/models/medicine_type.dart';

class MedicineTypeCard extends StatelessWidget {
  final MedicineType pillType;
  final Function handler;
  const MedicineTypeCard(this.pillType, this.handler, {super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => handler(pillType),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: pillType.isChoose
                  ? const Color.fromRGBO(255, 10, 10, 0.5)
                  : Colors.white,
            ),
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(width: 50, height: 50.0, child: pillType.image),
                const SizedBox(
                  height: 7.0,
                ),
                Text(
                  pillType.name,
                  style: TextStyle(
                      color: pillType.isChoose ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 15.0,
        )
      ],
    );
  }
}
