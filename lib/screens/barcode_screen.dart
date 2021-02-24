import 'package:datawiz/core/data.dart';
import 'package:flutter/material.dart';

class BarcodeScreen extends StatelessWidget {
  const BarcodeScreen(this.barcodeID);

  final barcodeID;
  @override
  Widget build(BuildContext context) {
    final barcode = Data.barcodes[barcodeID];

    return Scaffold(
      appBar: AppBar(
        title: Text('Штрихкод ${barcode['code']}'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text(
                barcode['code'],
                style: TextStyle(fontSize: 21),
              ),
              Text(''),
              Text(
                barcode['text'],
                style: TextStyle(fontSize: 17),
              ),
              Text(''),
              Text(
                'Отправил: ${barcode['display_name']}, ${barcode['email']}',
                style: TextStyle(fontSize: 17),
              ),
              Text(''),
              Text(
                'Отзывы: ',
                style: TextStyle(fontSize: 17),
              ),
              Text(''),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: barcode['reviews'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        children: [
                          Text(
                            'Отправил: ${barcode['reviews'][index]['display_name']}'
                          ),
                          Text('${barcode['reviews'][index]['email']}'),
                          Text(''),
                          Text('${barcode['reviews'][index]['text']}'),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
