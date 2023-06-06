// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:chapter_1/models/catalogs.dart';

class homeDetail extends StatelessWidget {
  final Item product;
  const homeDetail({
    Key? key,
    required this.product,
  })  : assert(product != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(
              tag: "key(product.name.toString())",
              child: Image.network(product.image,height: 300,)).h32(context).centered(),
          Expanded(
            child: VxArc(
              height: 20,
              edge: VxEdge.top,
              arcType: VxArcType.convey,

             child: Container(
              color: const Color.fromARGB(255, 248, 221, 221),
              width: context.screenWidth,
              child: Column(children: [
                 product.name.text.lg.bold
                .color(Color.fromARGB(255, 47, 87, 120))
                .make(),
            SizedBox(height: 5),
            product.dscr.text.textStyle(context.captionStyle).make(),
              ]),
             )),
          ),
          
          
        ],
      ),
    );
  }
}
