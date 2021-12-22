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

  //* Sample Products Static
  // static const List<Product> products = [
  //   Product(
  //     name: 'Mac Air',
  //     price: 1165.09,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2020&q=80',
  //   ),
  //   Product(
  //     name: 'Mac Pro',
  //     price: 1505.49,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1501163268664-3fdf329d019f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
  //   ),
  //   Product(
  //     name: 'iPhone 11',
  //     price: 689.97,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1571380401583-72ca84994796?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1064&q=80',
  //   ),
  // ];
}
