import 'package:datawiz/core/adding_review.dart';
import 'package:datawiz/core/functions/fetch_barcodes.dart';
import 'package:datawiz/screens/barcode_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class AddingReviewScreen extends StatelessWidget {
  AddingReviewScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавить штрихкод'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Введите отзыв на штрихкод',
                ),
                onChanged: (data) async {
                  context.read<AddingReview>().changeText(data);
                },
              ),
              InkWell(
                child: Container(
                  child: Text(
                    'Отправить отзыв на штрихкод',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                ),
                onTap: () async {
                  await context.read<AddingReview>().addReview();
                  await fetchBarcodes();
                  context.read<AddingReview>().changeText('');
                  int barcodeID = context.read<AddingReview>().barcodeID;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BarcodeScreen(barcodeID)),
                  );
                },
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
