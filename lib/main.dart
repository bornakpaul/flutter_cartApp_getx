import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getxcart/constants/color_constants.dart';
import 'package:getxcart/screens/main_screen.dart';
import 'package:getxcart/screens/onboarding.dart';

import 'controllers/main_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  const storage = FlutterSecureStorage();
  final isLoggedIn = await storage.read(key: "isLoggedIn");
  print("isloggedIn value: $isLoggedIn");
  runApp(CartApp(
    isLoggedIn: isLoggedIn,
  ));
}

class CartApp extends StatelessWidget {
  final String? isLoggedIn;
  const CartApp({
    Key? key,
    required this.isLoggedIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cart App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      initialRoute: isLoggedIn == null ? "/onBoarding" : "/mainScreen",
      getPages: [
        GetPage(
          name: "/onBoarding",
          page: () => OnBoardingPage(),
          binding: MainBinding(),
        ),
        GetPage(
          name: "/mainScreen",
          page: () => const MainScreen(),
          binding: MainBinding(),
        ),
      ],
    );
  }
}
