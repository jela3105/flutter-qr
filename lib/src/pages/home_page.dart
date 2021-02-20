import 'package:flutter/material.dart';

import 'package:qr_app/widges/custom_navigator_bar.dart';

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
      body: Center(
        child: Text('HomePage'),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
