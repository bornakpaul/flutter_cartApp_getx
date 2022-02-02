import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcart/constants/color_constants.dart';
import 'package:getxcart/screens/onboarding.dart';

import 'controllers/main_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CartApp());
}

class CartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cart App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => OnBoardingPage(),
          binding: MainBinding(),
        ),
      ],
    );
  }
}
