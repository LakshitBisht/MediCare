import 'package:flutter/material.dart';

class Snackbar {
  void showSnack(String message, BuildContext context, Function undo) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(message),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () => undo(),
            )),
      );
}
