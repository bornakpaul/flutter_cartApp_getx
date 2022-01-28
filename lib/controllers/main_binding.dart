import 'package:get/get.dart';
import 'package:getxcart/controllers/cart_controller.dart';
import 'package:getxcart/controllers/main_screen_controller.dart';
import 'package:getxcart/controllers/product_controller.dart';
import 'package:getxcart/controllers/profile_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    //Get.lazyPut<ProductDescController>(() => ProductDescController());
    //Get.lazyPut<PhoneAuthController>(() => PhoneAuthController(phoneNumber: ''));
  }
}
