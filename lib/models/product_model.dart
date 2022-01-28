import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  //* Product's variables: name, price, imageUrl. All required.

  final String name;
  final double price;
  final String imageUrl;

  //* Constructor
  const Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      price: snap['price'],
      imageUrl: snap['imageUrl'],
    );
    return product;
  }
}
