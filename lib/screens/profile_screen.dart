import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcart/controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return Scaffold(
      body: Center(
        child: Text(profileController.getCurrentUID().toString()),
      ),
    );
  }
}
