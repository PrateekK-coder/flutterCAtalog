import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int days = 30;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Text("Catalog App"),
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days of code"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
