import 'dart:convert';
import 'dart:io';
import 'package:datawiz/core/data.dart';
import 'package:path_provider/path_provider.dart';
import '../config.dart';
import 'functions/fetch_barcodes.dart';


Future<bool> init() async {
  // await Future.delayed(Duration(seconds: 2));

  Data.apiURL = config['apiURL'];
  Data.barcodes = await fetchBarcodes();
  final appDocumentsDirectory = await getApplicationDocumentsDirectory();
  final settingsFile = File('${appDocumentsDirectory.path}/settings.json');
  try {
    final contents = await settingsFile.readAsString();
    final settings = json.decode(contents);
    if (settings['isLoggedIn']) {
      Data.isSignedIn = settings['isLoggedIn'];
      Data.email = settings['email'];
      Data.displayName = settings['display_name'];
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  } catch (e) {
    await settingsFile.writeAsString(json.encode(defaultSettings));
    return Future.value(false);
  }
}
