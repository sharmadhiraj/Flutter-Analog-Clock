class TimeFormat {
  const TimeFormat._();

  static const List<String> _weekdays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  static const List<String> _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  static String hourMinute(DateTime time) =>
      "${_pad(time.hour)}:${_pad(time.minute)}";

  static String hourMinuteSecond(DateTime time) =>
      "${hourMinute(time)}:${_pad(time.second)}";

  static String date(DateTime time) =>
      "${_weekdays[time.weekday - 1]}, ${time.day} ${_months[time.month - 1]}";

  static String _pad(int value) => value.toString().padLeft(2, "0");
}
