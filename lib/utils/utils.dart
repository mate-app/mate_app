import 'package:url_launcher/url_launcher.dart';

Future handleRefresh() async {
  return Future.delayed(const Duration(seconds: 1), () => {});
}

Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
