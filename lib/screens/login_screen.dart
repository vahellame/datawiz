import 'package:datawiz/controllers/is_signed_in.dart';
import 'package:datawiz/core/data.dart';
import 'package:datawiz/core/functions/sign_in_with_google.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SignInButton(
              imagePosition: ImagePosition.left, // left or right
              buttonType: ButtonType.google,
              onPressed: () async {
                final data = await signInWithGoogle();
                final view = IsSignedIn.dataToView(data);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => view),
                );
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
