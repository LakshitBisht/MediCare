import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class PlatformSlider extends StatelessWidget {
  final int min, max, divisions, value;
  final Function handler;
  final Color color;

  const PlatformSlider(
      {super.key,
      required this.value,
      required this.handler,
      required this.color,
      required this.max,
      required this.min,
      required this.divisions});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoSlider(
            onChanged: (value) => handler(value),
            max: max.toDouble(),
            min: min.toDouble(),
            divisions: divisions,
            activeColor: Colors.red,
            value: value.toDouble(),
          )
        : Slider(
            value: value.toDouble(),
            onChanged: (value) => handler(value),
            max: max.toDouble(),
            min: min.toDouble(),
            divisions: divisions,
            activeColor: color,
          );
  }
}
