import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

Future handleRefresh() async {
  return Future.delayed(const Duration(seconds: 1), () => {});
}

String convertDateToString(DateTime datetime) {
  initializeDateFormatting('de_DE');
  return DateFormat('dd. MMM y', 'de_DE')
      .format(DateTime.parse(datetime.toString()));
}

Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

String removeDateFromDateTime(DateTime datetime) {
  initializeDateFormatting('de_DE');
  return DateFormat('', 'de_DE').add_Hm().format(datetime);
}
