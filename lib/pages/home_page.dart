import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/items.dart';
import 'package:flutter_catalog/utilities/routes.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/pages/home_widgets/catalog_list.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'dart:convert';
import 'package:flutter_catalog/widgets/themes.dart';

import 'home_widgets/catalog_header.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Icon(
          Icons.add_shopping_cart,
        ),
        backgroundColor: MyTheme.bluishColor,
      ),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  Expanded(
                    child: CatalogList(),
                  )
                else
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 300.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
              ],
            )),
      ),
    );
  }
}
