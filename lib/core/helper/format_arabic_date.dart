import 'package:intl/intl.dart';

String formatArabicDate(String isoDate) {
  // Parse ISO 8601 date
  DateTime dateTime = DateTime.parse(isoDate).toLocal();

  // Arabic locale
  final DateFormat formatter = DateFormat("dd MMMM, hh:mma", "ar");

  // Format and fix AM/PM symbols
  return formatter.format(dateTime).replaceAll('AM', 'ص').replaceAll('PM', 'م');
}
