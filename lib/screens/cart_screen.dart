import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcart/constants/color_constants.dart';
import 'package:getxcart/controllers/cart_controller.dart';
import 'package:getxcart/widgets/cart_products.dart';
import 'package:getxcart/widgets/cart_total.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

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
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/empty_cart.png',
                        scale: 6.0,
                      ),
                      const Text(
                        'Your Cart is empty!',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CartProducts(),
                    const SizedBox(height: 8),
                    CartTotal(),
                    const SizedBox(height: 8),
                    const PlaceOrderWidget(),
                    const SizedBox(height: 15),
                  ],
                ),
        ));
  }
}

class PlaceOrderWidget extends StatefulWidget {
  const PlaceOrderWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PlaceOrderWidget> createState() => _PlaceOrderWidgetState();
}

class _PlaceOrderWidgetState extends State<PlaceOrderWidget> {
  final CartController controller = Get.find();
  late Razorpay _razorPay;

  @override
  void initState() {
    super.initState();
    initializeRazorPay();
  }

  void initializeRazorPay() {
    _razorPay = Razorpay();
    _razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    _razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
  }

  void launchRazorPay() {
    double amountPay = double.parse(controller.total.toString()) * 100;

    var options = {
      'key': 'rzp_test_gTeTVyss8y5SVC',
      'amount': "$amountPay",
      'name': 'EcoCart',
      'description': 'Shopping',
      'prefill': {'contact': '0000000000', 'email': '0000@gmail.com'}
    };

    try {
      _razorPay.open(options);
    } catch (e) {
      print("Error: $e");
    }
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("Payment Failed");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    //print("${response.code} \n${response.message}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
            response.message != null ? response.message! : 'payment failed'),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(
        "${response.orderId} \n${response.paymentId} \n${response.signature}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(response.signature != null
            ? response.signature!
            : 'payment successfull'),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          launchRazorPay();
        },
        child: const Text("Confirm Order"),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
        ),
      ),
    );
  }
}
