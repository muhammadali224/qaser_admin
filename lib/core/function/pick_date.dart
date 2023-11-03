import 'package:flutter/material.dart';

import '../extension/date_extension.dart';

Future<String?> pickDate(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(
      const Duration(days: 1000),
    ),
    helpText: "إختر التاريخ",
    cancelText: "إلغاء",
    confirmText: "تأكيد",
  );
  return pickedDate?.parseDate() ?? "";
}
