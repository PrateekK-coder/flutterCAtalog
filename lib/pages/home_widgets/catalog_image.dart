import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          decoration: BoxDecoration(
              color: MyTheme.creamColor,
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(15),
          child: Image.network(
            image,
          ),
        ),
      ),
    );
  }
}
