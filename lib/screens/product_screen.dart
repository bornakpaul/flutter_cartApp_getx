import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final String productName;
  const ProductScreen({
    Key? key,
    required this.productName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          productName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
