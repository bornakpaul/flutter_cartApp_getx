import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcart/constants/color_constants.dart';
import 'package:getxcart/controllers/main_screen_controller.dart';
import 'package:getxcart/screens/cart_screen.dart';
import 'package:getxcart/screens/home_screen.dart';
import 'package:getxcart/screens/profile_screen.dart';
import 'package:getxcart/services/firestore_db.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            const HomeScreen(),
            CartScreen(),
            Provider(
              create: (context) => FirestoreDB(),
              child: const ProfileScreen(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kPrimaryColor,
          elevation: 0.0,
          //   type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          selectedLabelStyle: const TextStyle(fontSize: 16),
          unselectedLabelStyle: const TextStyle(fontSize: 16),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Profile',
            ),
          ],
          currentIndex: controller.tabIndex,
          onTap: controller.changeTabIndex,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () async {
            int number = 7337743323;
            String message =
                "Hey EcoCart team. I am facing some issues. Could you please assist me ?";
            String _url = "whatsapp://send?phone=$number&text=$message";
            await launchUrl(Uri.parse(_url));
          },
          child: const Icon(
            Icons.support_agent_rounded,
            size: 32,
          ),
        ),
      );
    });
  }
}
