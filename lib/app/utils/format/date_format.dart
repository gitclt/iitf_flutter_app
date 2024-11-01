import 'package:intl/intl.dart';

class DlDateFormat {
  String getFormatedDates(String? date) {
    if (date == null) return '';
    var inputFormat = DateFormat('M/d/yyyy HH:mm:ss a');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('yyyy-MM-dd');
    return outputFormat.format(inputDate);
  }

  String convertDateFormat(String date) {
    DateTime parsedDate = DateTime.parse(date.split('/').reversed.join('-'));
    return "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}";
  }

  String getFormattedTimestamp() {
    final now = DateTime.now();
    final formatted = now.millisecondsSinceEpoch.toString();
    return formatted;
  }
}
