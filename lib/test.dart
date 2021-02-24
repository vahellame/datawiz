import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
  // final response_0 = await http.get(
  //   'http://176.99.12.65/barcodes',
  // );
  // print("Response status: ${response_0.statusCode}");
  // print("Response body: ${response_0.body}");

  // final data_1 = {
  //   'code': 1,
  //   'text': 'чай',
  //   'email': 'vahellame@gmail.com',
  //   'display_name': 'Вадим',
  //
  // };
  // final response_1 = await http.post(
  //   'http://176.99.12.65/add_barcode',
  //   body: json.encode(data_1),
  // );
  // print("Response status: ${response_1.statusCode}");
  // print("Response body: ${response_1.body}");


  final data_2 = {
    'barcode_id': 1,
    'text': 'хороший чай',
    'email': 'vahellame@gmail.com',
    'display_name': 'Вадим',
  };
  final response_2 = await http.post(
    'http://176.99.12.65/add_review',
    body: json.encode(data_2),
  );
  print("Response status: ${response_2.statusCode}");
  print("Response body: ${response_2.body}");
}
