import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcart/controllers/cart_controller.dart';
import 'package:getxcart/models/product_model.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CartProductCard(
                controller: controller,
                product: controller.products.keys.toList()[index],
                quantity: controller.products.values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final FetchProduct product;
  final int quantity;
  final int index;
  const CartProductCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.index,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: const Offset(0, 4),
                  blurRadius: 6,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(
                  product.image,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              product.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              controller.removeProduct(product);
            },
            icon: const Icon(Icons.remove_circle),
          ),
          Text(
            quantity.toString(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {
              controller.addProduct(product);
            },
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
    );
  }
}
