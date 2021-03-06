import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/items.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                      catalog: catalog,
                    ),
                  ),
                ),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(
                image: catalog.imageUrl,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      catalog.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      catalog.desc,
                    ),
                    SizedBox(height: 12.0),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: EdgeInsets.zero,
                      children: [
                        Text(
                          "\$${catalog.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Add to cart"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).buttonColor),
                            shape: MaterialStateProperty.all(
                              StadiumBorder(),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        height: 150,
        width: 150,
      ),
    );
  }
}
