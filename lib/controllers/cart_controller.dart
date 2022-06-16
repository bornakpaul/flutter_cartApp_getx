import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcart/models/product_model.dart';

class CartController extends GetxController {
  //* Add a dictionary to store the products in the cart.
  final _products = {}.obs;
  int emptyCart = 1;

  void addProduct(FetchProduct product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
      'Product Added',
      'You have added ${product.title} to the cart',
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 1200),
      animationDuration: const Duration(milliseconds: 500),
      titleText: const Text(
        'Product Added',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w800, fontSize: 16),
      ),
    );
  }

  void removeProduct(FetchProduct product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }

    Get.snackbar(
      'Product Removed',
      'You have removed ${product.title} from the cart',
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 1200),
      animationDuration: const Duration(milliseconds: 500),
      titleText: const Text(
        'Product Removed',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w800, fontSize: 16),
      ),
    );
  }

  //* get products
  get products => _products;

  //* get productSubtotal
  get productSubtotal => _products.entries
      .map((product) => int.parse(product.key.price) * product.value)
      .toList();

  //* get total
  get total => _products.entries
      .map((product) => int.parse(product.key.price) * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
