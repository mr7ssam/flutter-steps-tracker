import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(dateTime);
}

String stringNowDateTime() {
  return formatDate(DateTime.now());
}

String yMMMdFormatter(DateTime dateTime) {
  return DateFormat.yMMMd().format(dateTime);
}
