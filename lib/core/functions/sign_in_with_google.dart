import 'dart:convert';
import 'dart:io';

import 'package:datawiz/core/data.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path_provider/path_provider.dart';

Future<bool> signInWithGoogle () async {
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  await googleSignIn.signIn();
  final isSignedIn = await googleSignIn.isSignedIn();
  print(googleSignIn.currentUser.displayName);
  if (isSignedIn) {
    Data.email = googleSignIn.currentUser.email;
    Data.isSignedIn = true;
    Data.displayName = googleSignIn.currentUser.displayName;
    final settings = {
      'isLoggedIn': true,
      'email': googleSignIn.currentUser.email,
      'display_name': googleSignIn.currentUser.displayName,
    };
    final appDocumentsDirectory = await getApplicationDocumentsDirectory();
    final settingsFile = File('${appDocumentsDirectory.path}/settings.json');
    await settingsFile.writeAsString(json.encode(settings));

    return true;
  }
  return false;
}