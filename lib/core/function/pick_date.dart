import 'package:flutter/material.dart';

Future<DateTime?> pickDate(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 1000)),
  );
}
