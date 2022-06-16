import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(createFactory: false)
class UploadProduct {
  final String listingIds;
  final String title;
  final String price;
  final String discount;
  final String image;

  UploadProduct(
    this.listingIds,
    this.title,
    this.price,
    this.discount,
    this.image,
  );

  Map<String, dynamic> toJson() => _$UploadProductToJson(this);
}

class FetchProduct {
  final String listingIds;
  final String title;
  final String price;
  final String discount;
  final String image;

  FetchProduct(
    this.listingIds,
    this.title,
    this.price,
    this.discount,
    this.image,
  );

  static FetchProduct fromSnapshot(DocumentSnapshot snap) {
    FetchProduct product = FetchProduct(
      snap['listingIds'],
      snap['title'],
      snap['price'],
      snap['discount'],
      snap['image'],
    );
    return product;
  }
}
