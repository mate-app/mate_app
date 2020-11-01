import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Date {
  final DateTime dateTime;
  final String dateFormat;

  Date({this.dateTime, this.dateFormat = 'dd MMM y'});

  String get asString =>
      dateTime != null ? _convertDateToString(dateTime, dateFormat) : '';
  String get onlyTime => _removeDateFromDatetime(dateTime) ?? '';

  String _convertDateToString(DateTime datetime, String dateFormat) {
    initializeDateFormatting('de_DE');
    if (datetime is DateTime) {
      return DateFormat(dateFormat, 'de_DE')
          .format(DateTime.parse(datetime.toString()));
    }
    return '';
  }

  String _removeDateFromDatetime(DateTime datetime) {
    initializeDateFormatting('de_DE');
    if (datetime is DateTime) {
      return DateFormat('', 'de_DE').add_Hm().format(datetime);
    }
    return '';
  }

  // this overrides the default behaviour when comparing to instances
  // of this class. Without this to dates where different, but now when
  // compared their datetime field is compared
  @override
  bool operator ==(dynamic other) {
    if (other is Date) {
      return dateTime == other.dateTime;
    }
    return false;
  }

  int _hashCode;
  @override
  int get hashCode => _hashCode ??= dateTime.hashCode;
}
