import 'package:flutter/material.dart';

import 'package:qr_app/widges/scan_tiles.dart';

class MapsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles(type: 'maps');
  }
}
