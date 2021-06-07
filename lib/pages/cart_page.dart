import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(right: 35.0),
          child: Text(
            "Cart",
          ),
        )),
      ),
    );
  }
}
