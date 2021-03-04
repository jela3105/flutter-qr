import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_app/providers/ui_provider.dart';
import 'package:qr_app/providers/scan_list_provider.dart';

import 'package:qr_app/widges/custom_navigator_bar.dart';
import 'package:qr_app/widges/scan_button.dart';

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
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return MapsPage();
      case 1:
        scanListProvider.loadScansByType('http');
        return AddressesPage();
      default:
        return MapsPage();
    }
  }
}
