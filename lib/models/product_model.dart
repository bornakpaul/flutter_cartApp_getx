import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  //* Product's variables: name, price, imageUrl. All required.

  final String name;
  final double price;
  final String imageUrl;
  final double discount;

  //* Constructor
  const Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.discount,
  });

//   static Product fromSnapshot(DocumentSnapshot snap) {
//     Product product = Product(
//       name: snap['name'],
//       price: snap['price'],
//       imageUrl: snap['imageUrl'],
//     );
//     return product;
//   }

  static const List<Product> products = [
    Product(
        name: 'Notebooks',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2073&q=80',
        discount: 5),
    Product(
        name: 'Diary',
        price: 220.00,
        imageUrl:
            'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1973&q=80',
        discount: 15),
    Product(
        name: 'Books',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1519682337058-a94d519337bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
        discount: 5),
    Product(
        name: 'Pens',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1510936994138-07e06c7c5add?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2076&q=80',
        discount: 5),
    Product(
        name: 'Pencil',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1568205612837-017257d2310a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80',
        discount: 5),
    Product(
        name: 'Ink Pen',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1620080207549-60efab274c16?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2832&q=80',
        discount: 5),
  ];

  static const List<Product> highLighterProducts = [
    Product(
        name: 'Highlighter',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2073&q=80',
        discount: 5),
    Product(
        name: 'Highlighter',
        price: 220.00,
        imageUrl:
            'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1973&q=80',
        discount: 15),
    Product(
        name: 'Highlighter',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1519682337058-a94d519337bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
        discount: 5),
  ];

  static const List<Product> otherProducts = [
    Product(
        name: 'Notebooks',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2073&q=80',
        discount: 5),
    Product(
        name: 'Diary',
        price: 220.00,
        imageUrl:
            'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1973&q=80',
        discount: 15),
  ];
  static const List<Product> stickynoteProduct = [
    Product(
        name: 'StickyNotes',
        price: 220.00,
        imageUrl:
            'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1973&q=80',
        discount: 15),
    Product(
        name: 'StickyNotes',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1519682337058-a94d519337bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
        discount: 5),
  ];
  static const List<Product> a4sheetProducts = [
    Product(
        name: 'A4sheet',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2073&q=80',
        discount: 5),
  ];
  static const List<Product> pencilProducts = [
    Product(
        name: 'Pencil',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1519682337058-a94d519337bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
        discount: 5),
  ];
  static const List<Product> penProduct = [
    Product(
        name: 'Pen',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2073&q=80',
        discount: 5),
    Product(
        name: 'Pen',
        price: 220.00,
        imageUrl:
            'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1973&q=80',
        discount: 15),
  ];
  static const List<Product> diaryProducts = [
    Product(
        name: 'Diary',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2073&q=80',
        discount: 5),
    Product(
        name: 'Diary',
        price: 220.00,
        imageUrl:
            'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1973&q=80',
        discount: 15),
    Product(
        name: 'Diary',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1519682337058-a94d519337bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
        discount: 5),
  ];
  static const List<Product> notebookProducts = [
    Product(
        name: 'Notebooks',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2073&q=80',
        discount: 5),
    Product(
        name: 'Notebooks',
        price: 220.00,
        imageUrl:
            'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1973&q=80',
        discount: 15),
    Product(
        name: 'Notebooks',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1519682337058-a94d519337bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
        discount: 5),
  ];
  static const List<Product> bookProducts = [
    Product(
        name: 'Book',
        price: 120.50,
        imageUrl:
            'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2073&q=80',
        discount: 5),
  ];
}
