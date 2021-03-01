import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_app/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        //String qrcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancel', false, ScanMode.QR);
        final qrcodeScanRes = 'http://fernando-herrera.com';
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        print('try to create a scan');
        scanListProvider.newScan(qrcodeScanRes);
        //scanListProvider.newScan('geo:12.12');
      },
    );
  }
}
