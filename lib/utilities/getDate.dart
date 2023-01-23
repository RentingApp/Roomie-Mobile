String getDate() {
  //DateTime now = DateTime.now();
  DateTime now = DateTime.parse("2022-10-01 18:02:52");
  DateTime advertDate = DateTime.parse("2022-09-26 18:01:48");

  Duration diff = now.difference(advertDate);
  int minute = diff.inMinutes;
  int hour = diff.inHours;
  int day = diff.inDays;
  int yearOfAdvert = advertDate.year;
  int yearOfNow = now.year;
  int monthOfAdvert = advertDate.month;
  int monthOfNow = now.month;
  int dayOfAdvert = advertDate.day;

  if (day == 0 && hour == 0 && minute == 0) {
    return 'now';
  }

  if (day == 0 && hour == 0) {
    return minute.toString() +
        " minute${controlOddEvenStatus(minute)} " +
        "ago";
  }
  if (day == 0) {
    return hour.toString() + " hour${controlOddEvenStatus(hour)} " + "ago";
  }

  if (yearOfAdvert != yearOfNow) {
    return "${dayOfAdvert}" +
        " ${getMonth(monthOfAdvert - 1)} " +
        "${yearOfAdvert}";
  }

  if (monthOfNow > monthOfAdvert) {
    return '${monthOfNow - monthOfAdvert}' +
        " month${controlOddEvenStatus(monthOfNow - monthOfAdvert)} " +
        "ago";
  }

  if (day < 7) {
    return day.toString() + " day${controlOddEvenStatus(day)} " + "ago";
  }

  if (day < 10) {
    return '1' + " week " + "ago";
  }

  if (day < 17) {
    return '2' + " weeks " + "ago";
  }

  if (day < 24) {
    return '3' + " weeks " + "ago";
  }

  return '4' + " weeks " + "ago";
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

String? controlOddEvenStatus(info) {
  if (info > 1) {
    return 's';
  }
  return '';
}

String getMonth(month) {
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  return months[month];
}
