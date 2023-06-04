// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:html';

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
    await Future.delayed(const Duration(seconds: 2));
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
          child: Column(
            children: [
              if (CataLog.items != null && CataLog.items.isNotEmpty)
                CataLogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
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
      itemBuilder: (context, index) {
        final product = CataLog.items[index];
        return catalogItem(product:product);
      },
      itemCount: CataLog.items.length,
    );
  }
}

class catalogItem extends StatelessWidget {
  final Item product;

  const catalogItem({
    Key? key,
    required this.product,
  }) :assert(product != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Image.network(product.image).box.p4.rounded.
          color(Color.fromARGB(255, 245, 238, 238),).make().p12().w32(context)
        ],
      )
    ).square(100).rounded.color(Colors.white)  .make().py16();
  }
}
