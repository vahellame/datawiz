import 'package:datawiz/screens/home_screen.dart';
import 'package:datawiz/screens/login_screen.dart';
import 'package:flutter/material.dart';

class IsSignedIn {
  static Widget dataToView(bool data) {
    Widget view;

    switch (data) {
      case true:
        return HomeScreen();
        break;
      case false:
        return LoginScreen();
        break;
    }
    return view;
  }
}