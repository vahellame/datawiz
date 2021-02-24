import 'package:datawiz/core/adding_barcode.dart';
import 'package:datawiz/core/functions/fetch_barcodes.dart';
import 'package:datawiz/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AddingBarcodeScreen extends StatelessWidget {
  const AddingBarcodeScreen();

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
                  labelText: 'Введите штрихкод',
                ),
                onChanged: (data) {
                  context.read<AddingBarcode>().changeCode(data);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Введите описание штрихкода',
                ),
                onChanged: (data) async {
                  context.read<AddingBarcode>().changeText(data);
                },
              ),
              InkWell(
                child: Container(
                  child: Text(
                    'Отправить штрихкод',
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
                  await context.read<AddingBarcode>().addBarcode();
                  await fetchBarcodes();
                  context.read<AddingBarcode>().changeText('');
                  context.read<AddingBarcode>().changeCode('');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
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
