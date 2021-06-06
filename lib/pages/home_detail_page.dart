import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/items.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              Text(
                "\$${catalog.price}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 120.0, height: 50),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Add to cart",
                    style: TextStyle(fontSize: 15),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyTheme.bluishColor),
                    shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.imageUrl),
              ).h32(context),
              Expanded(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 64),
                      child: Column(
                        children: [
                          Text(
                            catalog.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 32),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            catalog.desc,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
