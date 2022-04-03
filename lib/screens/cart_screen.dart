import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcart/constants/color_constants.dart';
import 'package:getxcart/controllers/cart_controller.dart';
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
          centerTitle: true,
          title: const Text(
            'Cart',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          backgroundColor: kPrimaryColor,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.transparent,
          ),
        ),
        body: Obx(
          () => controller.products.length == 0
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/empty_cart.png',
                        scale: 6.0,
                      ),
                      Text(
                        'Your Cart is empty!',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kPrimaryColor),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
        ));
  }
}
