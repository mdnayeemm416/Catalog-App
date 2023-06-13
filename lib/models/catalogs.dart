// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CataLog {
  static List<Item> items = [];

  static Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String dscr;
  final int price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.dscr,
    required this.price,
    required this.color,
    required this.image,
  });

  Item copyWith({
    int? id,
    String? name,
    String? dscr,
    int? price,
    String? color,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      dscr: dscr ?? this.dscr,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'dscr': dscr,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      dscr: map['dscr'] as String,
      price: map['price'] as int,
      color: map['color'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, dscr: $dscr, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.dscr == dscr &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        dscr.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
