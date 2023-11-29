import 'package:flutter/material.dart';
import 'package:medicare/widgets/platform_slider.dart';

class UserSlider extends StatelessWidget {
  final Function handler;
  final int howManyWeeks;
  const UserSlider(this.handler, this.howManyWeeks, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: PlatformSlider(
          divisions: 11,
          min: 1,
          max: 10,
          value: howManyWeeks,
          color: Colors.red,
          handler: handler,
        )),
      ],
    );
  }
}
