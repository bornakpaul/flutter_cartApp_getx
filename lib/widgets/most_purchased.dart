import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcart/constants/color_constants.dart';
import 'package:getxcart/controllers/cart_controller.dart';
import 'package:getxcart/controllers/product_controller.dart';
import 'package:getxcart/models/product_model.dart';

class MostPurchased extends StatelessWidget {
//   final mostPurchasedController = Get.put(
//     MostPurchasedController(),
//   );

  MostPurchased({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 200,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Product.products.length,
            itemBuilder: (BuildContext context, int index) {
              return MostPurchasedCard(index: index);
            }),
      ),
    );
  }
}

class MostPurchasedCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final MostPurchasedController productController = Get.find();
  final int index;
  MostPurchasedCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 4,
              color: Color.fromRGBO(0, 0, 0, 0.16),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                ),
                child: Image(
                  image: NetworkImage(
                    Product.products[index].imageUrl,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Product.products[index].name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '₹' + Product.products[index].price.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        Product.products[index].discount.toString() + '% off',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade400,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartController.addProduct(Product.products[index]);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 35.0,
                          ),
                          child: Text(
                            'Add to cart',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
