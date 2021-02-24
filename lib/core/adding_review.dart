import 'dart:convert';
import 'package:datawiz/core/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AddingReview with ChangeNotifier {
  AddingReview();

  String text = '';
  int barcodeID;


  Future<void> addReview () async {
    final data = {
      'barcode_id': barcodeID + 1,
      'text': text,
      'email': Data.email,
      'display_name': Data.displayName,
    };
    await http.post(
      'http://176.99.12.65/add_review',
      body: json.encode(data),
    );
  }

  void changeText (data) {
    text = data;
  }

  void changeBarcodeID(data) {
    barcodeID = data;
  }
}
