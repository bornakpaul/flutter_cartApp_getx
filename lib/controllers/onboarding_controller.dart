import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  List<OnBoardingInfo> onboardingPages = const [
    OnBoardingInfo(
      imageAsset: 'assets/images/img1.png',
      description:
          'Order from your college stationary shop for best quality products.',
      title: 'College Stationary',
    ),
    OnBoardingInfo(
      imageAsset: 'assets/images/img2.png',
      description:
          'Fast and Free delivery of your products instantly, as you order',
      title: 'Fast Delivery',
    ),
    OnBoardingInfo(
      imageAsset: 'assets/images/img3.png',
      description:
          'Easily pay for your products through any medium - online or cash.',
      title: 'Easy Payments',
    ),
  ];
}
