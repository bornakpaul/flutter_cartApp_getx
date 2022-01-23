import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:getxcart/models/onboarding_info.dart';
import 'package:getxcart/screens/login_screen.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController(); //inbuilt controller in flutter

  forwardAction() {
    if (isLastPage) {
      Get.to(LoginScreen());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnBoardingInfo> onboardingPages = [
    OnBoardingInfo(
      'assets/images/img1.png',
      'Order from your college stationary shop for best quality products.',
      'College Stationary',
    ),
    OnBoardingInfo(
      'assets/images/img2.png',
      'Fast and Free delivery of your products instantly, as you order',
      'Fast Delivery',
    ),
    OnBoardingInfo(
      'assets/images/img3.png',
      'Easily pay for your products through any medium - online or cash.',
      'Easy Payments',
    ),
  ];
}
