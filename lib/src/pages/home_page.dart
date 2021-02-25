import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/db_provider.dart';

import 'package:qr_app/widges/custom_navigator_bar.dart';
import 'package:qr_app/widges/scan_button.dart';

import 'package:qr_app/providers/ui_provider.dart';

import 'package:qr_app/src/pages/maps_page.dart';
import 'package:qr_app/src/pages/addresses_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("History"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    //TODO: read database temporary

    final tempScan = ScanModel(value: 'http://google.com');
    DBProvider.db.getScanById(4).then((scan) => print(scan.value));

    switch (currentIndex) {
      case 0:
        return MapsPage();
      case 1:
        return AddressesPage();
      default:
        return MapsPage();
    }
  }
}
