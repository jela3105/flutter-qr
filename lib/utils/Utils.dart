import 'package:flutter/material.dart';
import 'package:qr_app/providers/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.value;
  if (scan.type == 'http') {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  } else {
    print('geo location');
  }
}
