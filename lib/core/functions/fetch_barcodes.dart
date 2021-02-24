import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data.dart';

Future<List> fetchBarcodes() async {
  final response = await http.get(
    '${Data.apiURL}/barcodes',
  );
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    Data.barcodes = data['barcodes'];
    return data['barcodes'];
  }
  return [];
}