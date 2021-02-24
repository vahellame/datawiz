import 'package:datawiz/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/adding_barcode.dart';
import 'core/adding_review.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AddingBarcode>(create: (context) => AddingBarcode()),
        ChangeNotifierProvider<AddingReview>(create: (context) => AddingReview()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
// GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
// await googleSignIn.signIn();
// bool isSignedIn = await googleSignIn.isSignedIn();
// print(googleSignIn.currentUser.email);
// print(googleSignIn.currentUser.id);
// Data.email = googleSignIn.currentUser.email;
// Data.isSignedIn = true;
