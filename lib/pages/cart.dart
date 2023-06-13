import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: 'cart'.text.black.make().centered()),
      body: Column(
        children: [
          _cartItem().p32().expand(),
          Divider(),
          _cartButton(),
        ],
      ),
    );
  }
}

class _cartButton extends StatelessWidget {
  const _cartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999"
              .text
              .xl3
              .color(const Color.fromARGB(255, 3, 31, 54))
              .bold
              .make(),
          WidthBox(50),
          ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(StadiumBorder()),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: "Buy".text.make())
              .w24(context)
        ],
      ),
    );
  }
}

class _cartItem extends StatelessWidget {
  const _cartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              title: "Item 1".text.make(),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {},
              ),
            ));
  }
}
