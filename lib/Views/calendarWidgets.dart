import 'package:crib_hunter/Models/appConstants.dart';
import 'package:flutter/material.dart';

class CalendarMonthWidget extends StatefulWidget {
  final int monthIndex;
  final List<DateTime> bookedDates;

  CalendarMonthWidget({Key key, this.monthIndex, this.bookedDates})
      : super(key: key);

  @override
  _CalendarMonthState createState() => _CalendarMonthState();
}

class _CalendarMonthState extends State<CalendarMonthWidget> {
  List<MonthTile> _monthTiles;
  int _currentMonthInt;
  int _currentYearInt;

  void _setUpMonthTiles() {
    setState(() {
      _monthTiles = [];
      int daysInMonth = AppConstants.daysInMonths[_currentMonthInt];
      DateTime firstDayOfMonth = DateTime(_currentYearInt, _currentMonthInt, 1);
      int firstWeekdayOfMonth = firstDayOfMonth.weekday;
      if (firstWeekdayOfMonth != 7) {
        for (int i = 0; i < firstWeekdayOfMonth; i++) {
          _monthTiles.add(MonthTile(
            dateTime: null,
          ));
        }
      }
      for (int i = 1; i <= daysInMonth; i++) {
        DateTime date = DateTime(_currentYearInt, _currentMonthInt, i);
        _monthTiles.add(
          MonthTile(dateTime: date),
        );
      }
    });
  }

  @override
  void initState() {
    _currentMonthInt = (DateTime.now().month + widget.monthIndex) % 12;
    if (_currentMonthInt == 0) {
      _currentMonthInt = 12;
    }

    _currentYearInt = DateTime.now().year;
    if (_currentMonthInt < DateTime.now().month) {
      _currentYearInt += 1;
    }
    _setUpMonthTiles();

    super.initState();
    print('unavailable dates: ${widget.bookedDates}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Text(
              "${AppConstants.monthDict[_currentMonthInt]} - $_currentYearInt"),
        ),
        GridView.builder(
          itemCount: _monthTiles.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1 / 1,
          ),
          itemBuilder: (context, index) {
            MonthTile monthTile = _monthTiles[index];
            if (widget.bookedDates.contains(monthTile.dateTime)) {
              return MaterialButton(
                onPressed: null,
                child: monthTile,
                color: Colors.yellow,
                disabledColor: Colors.yellow,
              );
            }
            return MaterialButton(
              onPressed: () {},
              child: monthTile,
            );
          },
        ),
      ],
    );
  }
}

class MonthTile extends StatelessWidget {
  final DateTime dateTime;

  MonthTile({this.dateTime, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(this.dateTime == null ? "" : this.dateTime.day.toString());
  }
}
