import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcart/constants/color_constants.dart';
import 'package:getxcart/controllers/cart_controller.dart';
import 'package:getxcart/controllers/product_controller.dart';
import 'package:getxcart/models/product_model.dart';

class ProductScreen extends StatefulWidget {
  final String productName;
  const ProductScreen({
    Key? key,
    required this.productName,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> _products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.productName == "Highlighter") {
      _products = Product.highLighterProducts;
    } else if (widget.productName == "Books") {
      _products = Product.bookProducts;
    } else if (widget.productName == "Notebook") {
      _products = Product.notebookProducts;
    } else if (widget.productName == "Diary") {
      _products = Product.diaryProducts;
    } else if (widget.productName == "Pens") {
      _products = Product.penProduct;
    } else if (widget.productName == "Pencil") {
      _products = Product.pencilProducts;
    } else if (widget.productName == "A4 sheet") {
      _products = Product.a4sheetProducts;
    } else if (widget.productName == "StickyNotes") {
      _products = Product.stickynoteProduct;
    } else if (widget.productName == "Others") {
      _products = Product.otherProducts;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          widget.productName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        children: _products
            .map((e) => ProductCards(
                image: e.imageUrl,
                discount: e.discount,
                price: e.price,
                title: e.name,
                product: e))
            .toList(),
      ),
    );
  }
}

class ProductCards extends StatelessWidget {
  final cartController = Get.put(CartController());
  final MostPurchasedController productController = Get.find();
  final Product product;
  //final int index;
  final String image;
  final String title;
  final double price;
  final double discount;
  ProductCards({
    Key? key,
    //required this.index,
    required this.image,
    required this.discount,
    required this.price,
    required this.title,
    required this.product,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              height: 100,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                ),
                child: Image(
                  image: NetworkImage(image, scale: 10),
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
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '₹' + price.toString(),
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
                        discount.toString() + '% off',
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
                  GestureDetector(
                    onTap: () {
                      cartController.addProduct(product);
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
