import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getxcart/models/product_model.dart';

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Stream<List<Product>> getAllProducts() {
//     return _firebaseFirestore
//         .collection('productNotebook')
//         .snapshots()
//         .map((snapshot) {
//       return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
//     });
//   }

  // GET UID
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser!.uid);
  }

  //
  Future getCurrentUser() async {
    return await _firebaseAuth.currentUser!;
  }
}
