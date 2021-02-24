import 'package:datawiz/core/data.dart';
import 'package:datawiz/screens/barcode_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BarcodeCard extends StatelessWidget {
  BarcodeCard(this.barcodeID);

  final barcodeID;

  @override
  Widget build(BuildContext context) {
    final barcode = Data.barcodes[barcodeID];
    return InkWell(
      child: Container(
        child: Column(
          children: [
            Text(
              barcode['code'],
              style: TextStyle(fontSize: 21),
            ),
            Text(
              barcode['text'],
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BarcodeScreen(barcodeID)),
        );
      },
    );
  }
}
