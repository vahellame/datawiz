import 'package:datawiz/controllers/is_signed_in.dart';
import 'package:datawiz/core/init.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final initStatus = init();
    initStatus.then(
      (value) {
        final view = IsSignedIn.dataToView(value);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => view),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Datawiz Test Task',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 32,
              ),
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
