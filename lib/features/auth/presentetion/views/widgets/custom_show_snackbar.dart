import 'package:flutter/material.dart';

void customShowSnackBar({required BuildContext context, required String msg}) {
  final snackBar = SnackBar(
    content: Text(msg),
  );

  // Use ScaffoldMessenger to show the SnackBar
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
