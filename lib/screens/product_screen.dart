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
  List<FetchProduct> _products = [];
  final _bookController = Get.put(
    BooksController(),
  );
  final _noteBookController = Get.put(
    NoteBookController(),
  );
  final _diaryController = Get.put(
    DiaryController(),
  );
  final _pensController = Get.put(
    PensController(),
  );
  final _pencilController = Get.put(
    PencilController(),
  );
  final _highlighterController = Get.put(
    HighlighterController(),
  );
  final _a4SheetController = Get.put(
    A4SheetController(),
  );
  final _stickyController = Get.put(
    StickyController(),
  );
  final _othersController = Get.put(
    OthersController(),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.productName == "Highlighter") {
      _products = _highlighterController.productsHighlighter;
    } else if (widget.productName == "Books") {
      _products = _bookController.productsBooks;
    } else if (widget.productName == "Notebook") {
      _products = _noteBookController.productsNoteBooks;
    } else if (widget.productName == "Diary") {
      _products = _diaryController.productsDiary;
    } else if (widget.productName == "Pens") {
      _products = _pensController.productsPens;
    } else if (widget.productName == "Pencil") {
      _products = _pencilController.productsPencil;
    } else if (widget.productName == "A4 sheet") {
      _products = _a4SheetController.productsA4Sheet;
    } else if (widget.productName == "StickyNotes") {
      _products = _stickyController.productsStickyNotes;
    } else if (widget.productName == "Others") {
      _products = _othersController.productsOthers;
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
        body: Obx(
          () => GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            children: _products
                .map((e) => ProductCards(
                    image: e.image,
                    discount: e.discount,
                    price: e.price,
                    title: e.title,
                    product: e))
                .toList(),
          ),
        ));
  }
}

class ProductCards extends StatelessWidget {
  final cartController = Get.put(CartController());
  final FetchProduct product;

  final String image;
  final String title;
  final String price;
  final String discount;
  ProductCards({
    Key? key,
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
                  fit: BoxFit.cover,
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
