import 'package:flutter/material.dart';
import '../../models/calendar_day_model.dart';
import '../../widgets/calendar_day.dart';

class Calendar extends StatefulWidget {
  final Function chooseDay;
  final List<CalendarDayModel> _daysList;
  const Calendar(this.chooseDay, this._daysList, {super.key});
  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return SizedBox(
      height: deviceHeight * 0.11,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...widget._daysList.map((day) => CalendarDay(day, widget.chooseDay))
        ],
      ),
    );
  }
}
