import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

Future<DateTime?> pickDate(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 10000)),
    helpText: "إختر التاريخ",
    cancelText: "إلغاء",
    confirmText: "تأكيد",
  );
  return pickedDate;
}

Future<DateTime?> pickMonth(BuildContext context) async {
  DateTime? pickedDate = await showMonthPicker(
    context: context,
    locale: Locale("ar"),
    initialDate: DateTime.now(),
    dismissible: true,
    roundedCornersRadius: 15,
    lastDate: DateTime.now().add(const Duration(days: 10000)),
  );
  return pickedDate;
}
