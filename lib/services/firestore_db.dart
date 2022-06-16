import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getxcart/models/product_model.dart';

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<List<FetchProduct>> getMostPurchased() {
    return _firebaseFirestore
        .collection('MOST_PURCHASED')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => FetchProduct.fromSnapshot(doc))
          .toList();
    });
  }

  Stream<List<FetchProduct>> getBooks() {
    return _firebaseFirestore.collection('BOOKS').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => FetchProduct.fromSnapshot(doc))
          .toList();
    });
  }

  Stream<List<FetchProduct>> getNotebook() {
    return _firebaseFirestore
        .collection('NOTEBOOK')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => FetchProduct.fromSnapshot(doc))
          .toList();
    });
  }

  Stream<List<FetchProduct>> getDairy() {
    return _firebaseFirestore.collection('DAIRY').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => FetchProduct.fromSnapshot(doc))
          .toList();
    });
  }

  Stream<List<FetchProduct>> getPENS() {
    return _firebaseFirestore.collection('PENS').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => FetchProduct.fromSnapshot(doc))
          .toList();
    });
  }

  Stream<List<FetchProduct>> getPencil() {
    return _firebaseFirestore.collection('PENCIL').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => FetchProduct.fromSnapshot(doc))
          .toList();
    });
  }

  Stream<List<FetchProduct>> getHighlighter() {
    return _firebaseFirestore
        .collection('HIGHLIGHTER')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => FetchProduct.fromSnapshot(doc))
          .toList();
    });
  }

  Stream<List<FetchProduct>> getA4Sheet() {
    return _firebaseFirestore
        .collection('A4_SHEET')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => FetchProduct.fromSnapshot(doc))
          .toList();
    });
  }

  Stream<List<FetchProduct>> getStickyNotes() {
    return _firebaseFirestore
        .collection('STICKY_NOTES')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => FetchProduct.fromSnapshot(doc))
          .toList();
    });
  }

  Stream<List<FetchProduct>> getOthers() {
    return _firebaseFirestore.collection('OTHERS').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => FetchProduct.fromSnapshot(doc))
          .toList();
    });
  }

  // GET UID
  Future<String> getCurrentUID() async {
    return (_firebaseAuth.currentUser!.uid);
  }

  //
  Future getCurrentUser() async {
    return _firebaseAuth.currentUser!;
  }
}
