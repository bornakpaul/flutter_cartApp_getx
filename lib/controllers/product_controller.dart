import 'package:get/get.dart';
import 'package:getxcart/models/product_model.dart';
import 'package:getxcart/services/firestore_db.dart';

class MostPurchasedController extends GetxController {
  final productsMostPurchased = <FetchProduct>[].obs;

  @override
  void onInit() {
    productsMostPurchased.bindStream(FirestoreDB().getMostPurchased());
    super.onInit();
  }
}

class NoteBookController extends GetxController {
  final productsNoteBooks = <FetchProduct>[].obs;

  @override
  void onInit() {
    productsNoteBooks.bindStream(FirestoreDB().getNotebook());
    super.onInit();
  }
}

class BooksController extends GetxController {
  final productsBooks = <FetchProduct>[].obs;

  @override
  void onInit() {
    productsBooks.bindStream(FirestoreDB().getBooks());
    super.onInit();
  }
}

class DiaryController extends GetxController {
  final productsDiary = <FetchProduct>[].obs;

  @override
  void onInit() {
    productsDiary.bindStream(FirestoreDB().getDairy());
    super.onInit();
  }
}

class PensController extends GetxController {
  final productsPens = <FetchProduct>[].obs;

  @override
  void onInit() {
    productsPens.bindStream(FirestoreDB().getPENS());
    super.onInit();
  }
}

class PencilController extends GetxController {
  final productsPencil = <FetchProduct>[].obs;

  @override
  void onInit() {
    productsPencil.bindStream(FirestoreDB().getPencil());
    super.onInit();
  }
}

class HighlighterController extends GetxController {
  final productsHighlighter = <FetchProduct>[].obs;

  @override
  void onInit() {
    productsHighlighter.bindStream(FirestoreDB().getHighlighter());
    super.onInit();
  }
}

class A4SheetController extends GetxController {
  final productsA4Sheet = <FetchProduct>[].obs;

  @override
  void onInit() {
    productsA4Sheet.bindStream(FirestoreDB().getA4Sheet());
    super.onInit();
  }
}

class StickyController extends GetxController {
  final productsStickyNotes = <FetchProduct>[].obs;

  @override
  void onInit() {
    productsStickyNotes.bindStream(FirestoreDB().getStickyNotes());
    super.onInit();
  }
}

class OthersController extends GetxController {
  final productsOthers = <FetchProduct>[].obs;

  @override
  void onInit() {
    productsOthers.bindStream(FirestoreDB().getOthers());
    super.onInit();
  }
}
