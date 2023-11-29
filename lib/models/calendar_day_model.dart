import 'package:intl/intl.dart';

class CalendarDayModel {
  String dayLetter;
  int dayNumber;
  int month;
  int year;
  bool isChecked;

  CalendarDayModel(
      {this.dayLetter = 'M',
      this.dayNumber = 1,
      this.year = 2023,
      this.month = 1,
      this.isChecked = false});

  //----------------| get current 7 days |----------------------
  List<CalendarDayModel> getCurrentDays() {
    List<CalendarDayModel> daysList = <CalendarDayModel>[];
    DateTime currentTime = DateTime.now();
    for (int i = 0; i < 7; i++) {
      daysList.add(CalendarDayModel(
          dayLetter: DateFormat.E().format(currentTime).toString()[0],
          dayNumber: currentTime.day,
          month: currentTime.month,
          year: currentTime.year,
          isChecked: false));
      currentTime = currentTime.add(const Duration(days: 1));
    }
    daysList[0].isChecked = true;
    return daysList;
  }
  //============================================================
}
