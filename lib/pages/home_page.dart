// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:html';

import 'package:chapter_1/pages/home_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:chapter_1/models/catalogs.dart';
import 'package:chapter_1/widgets/drawer.dart';
import 'package:chapter_1/widgets/item_widget.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  void initState() {
    super.initState();
    loadjson();
  }

  loadjson() async {
    await Future.delayed(const Duration(seconds: 1));
    final ItemJson = await rootBundle.loadString('files/item.json');
    final DecodeItem = jsonDecode(ItemJson);
    var itemData = DecodeItem['items'];
    CataLog.items =
        List.from(itemData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 238, 238),
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Center(child: "CataLog App".text.make()),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (CataLog.items != null && CataLog.items.isNotEmpty)
              CataLogList().expand()
            else
              CircularProgressIndicator().centered(),
          ]),
        ),
      ),
    );
  }
}

class CataLogList extends StatelessWidget {
  const CataLogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CataLog.items.length,
      itemBuilder: (context, index) {
        final product = CataLog.items[index];
        return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => 
              homeDetail(product: product)));
            },
            child: catalogItem(product: product));
      },
    );
  }
}

class catalogItem extends StatelessWidget {
  final Item product;

  const catalogItem({
    Key? key,
    required this.product,
  })  : assert(product != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: "key(product.name.toString())",
          child: CatalogImage(image: product.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            product.name.text.lg.bold
                .color(Color.fromARGB(255, 47, 87, 120))
                .make(),
            SizedBox(height: 5),
            product.dscr.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mOnly(right: 20),
              children: [
                "\$${product.price}"
                    .text
                    .xl
                    .bold
                    .color(Color.fromARGB(255, 33, 62, 87))
                    .make(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(StadiumBorder()),
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: "Buy".text.make(),
                )
              ],
            ).pOnly(right: 40)
          ],
        ))
      ],
    )).square(100).rounded.color(Colors.white).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p4
        .rounded
        .color(
          Color.fromARGB(255, 245, 238, 238),
        )
        .make()
        .p12()
        .w32(context);
  }
}
