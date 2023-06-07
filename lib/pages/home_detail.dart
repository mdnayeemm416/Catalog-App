// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:chapter_1/models/catalogs.dart';

class homeDetail extends StatelessWidget {
  final Item product;
  const homeDetail({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 206, 241, 225),
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const StadiumBorder()),
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 36, 51, 69)),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 10)),
                alignment:
                    Alignment.center, // Aligns the text within the button
              ),
              child: const Text(
                "Buy",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ).h8(context).w32(context)
          ],
        ),
      ),
      body: Column(
        children: [
          Image.network(product.image).centered(),
          Expanded(
              child: VxArc(
                  height: 40,
                  edge: VxEdge.top,
                  arcType: VxArcType.convey,
                  child: Container(
                    color: Color.fromARGB(255, 206, 241, 225),
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        product.name.text.xl4.bold.make().py4(),
                        product.dscr.text
                            .textStyle(context.captionStyle)
                            .lg
                            .make(),
                        "\$${product.price}"
                            .text
                            .xl2
                            .bold
                            .color(Color.fromARGB(255, 220, 11, 63))
                            .make()
                            .py20(),
                      ],
                    ).py64(),
                  )))
        ],
      ),
    );
  }
}
