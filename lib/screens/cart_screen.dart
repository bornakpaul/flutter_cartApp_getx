import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcart/controllers/cart_controller.dart';
import 'package:getxcart/models/product_model.dart';
import 'package:getxcart/widgets/cart_products.dart';
import 'package:getxcart/widgets/cart_total.dart';

class CartScreen extends StatelessWidget {
  final CartController controller = Get.put(CartController());
  CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: Obx(
          () => controller.products.length == 0
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Cart is empty'),
                      ElevatedButton(
                        onPressed: () => Get.back(),
                        child: Text("Add products"),
                      ),
                    ],
                  )))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CartProducts(),
                    SizedBox(height: 8),
                    CartTotal(),
                    SizedBox(height: 8),
                    ElevatedButton(
              onPressed: () {},
              child: Text("Place Order"),
            ),
            SizedBox(height: 15),
                  ],
                ),
        ));
  }
}
