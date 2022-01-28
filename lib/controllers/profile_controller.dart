import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final _auth = FirebaseAuth.instance;
  Future<String> getCurrentUID() async {
    return await _auth.currentUser!.uid;
  }
}
