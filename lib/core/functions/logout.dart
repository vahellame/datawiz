import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../data.dart';

Future<void> logout () async {
  Data.isSignedIn = false;
  Data.email = '';
  Data.displayName = '';

  final settings = {
    'isLoggedIn': false,
    'email': '',
    'display_name': '',
  };
  final appDocumentsDirectory = await getApplicationDocumentsDirectory();
  final settingsFile = File('${appDocumentsDirectory.path}/settings.json');
  await settingsFile.writeAsString(json.encode(settings));
}