import 'package:flutter/material.dart';

showSnackBar({
  required BuildContext context,
  required String message,
  bool isError = true,
}) {
  SnackBar snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        fontSize: 17,
        color: Colors.white,
      ),
    ),
    backgroundColor: (isError) ? Colors.red : Colors.green,
    elevation: 4,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}