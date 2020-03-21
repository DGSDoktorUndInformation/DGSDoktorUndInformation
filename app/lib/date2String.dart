import 'package:intl/intl.dart';

String convertDateToString(DateTime date) {
  return date == null ? "" : DateFormat('dd.MM.yyyy').format(date);
}