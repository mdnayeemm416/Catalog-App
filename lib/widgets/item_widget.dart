import 'package:chapter_1/models/catalogs.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item product;

  const ItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print(product.name);
        },
        leading: Image.network(product.image),
        title: Text(product.name),
        subtitle: Text(product.dscr),
        trailing: Text(
          '\$${product.price}',
          textScaleFactor: 1.5,
          style: TextStyle(color: Colors.purpleAccent),
        ),
      ),
    );
  }
}
