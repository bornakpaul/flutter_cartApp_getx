import 'package:get/get.dart';
import 'package:getxcart/models/product_model.dart';
import 'package:getxcart/services/firestore_db.dart';

class MostPurchasedController extends GetxController {
  //final products = <Product>[].obs;

  @override
  void onInit() {
    // products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}
