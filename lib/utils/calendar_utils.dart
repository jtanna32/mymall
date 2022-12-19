import 'package:flutter/material.dart';

class CalendarUtils {
  static Future<String?> getDate(BuildContext context) async {
    DateTime _date = DateTime.now();
    final DateTime? picked = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate:
            DateTime(_date.year, _date.month, _date.day, _date.hour + 1),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Colors.white, //Head background
            ),
            child: child!,
          );
        });
    if (picked != null && picked != _date) {
      return picked.toString().split(" ")[0];
    }
  }
}
