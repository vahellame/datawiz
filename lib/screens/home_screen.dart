import 'package:datawiz/core/data.dart';
import 'package:datawiz/core/functions/fetch_barcodes.dart';
import 'package:datawiz/core/functions/logout.dart';
import 'package:datawiz/screens/adding_barcode_screen.dart';
import 'package:datawiz/screens/login_screen.dart';
import 'package:datawiz/widgets/barcode_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Штрихкоды'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.update,
              color: Colors.white,
            ),
            onPressed: () async {
              Data.barcodes = await fetchBarcodes();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () async {
              logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: Data.barcodes.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: BarcodeCard(index),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddingBarcodeScreen()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
