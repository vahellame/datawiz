import 'dart:convert';
import 'package:datawiz/core/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AddingBarcode with ChangeNotifier {
  AddingBarcode();

  String code = '';
  String text = '';

  Future<void> addBarcode () async {
    final data = {
      'code': code,
      'text': text,
      'email': Data.email,
      'display_name': Data.displayName,
    };
    await http.post(
      '${Data.apiURL}/add_barcode',
      body: json.encode(data),
    );
  }

  void changeCode (data) {
    code = data;
  }
  void changeText (data) {
    text = data;
  }
}
