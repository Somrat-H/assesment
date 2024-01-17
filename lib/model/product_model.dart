import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? image;
  String? name;
  String? details;
  int? price;

  ProductModel({this.details, this.image, this.name, this.price});

  factory ProductModel.fromFirestore(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ProductModel(
        details: data["details"],
        image: data["image"],
        name: data["name"],
        price: data["price"]);
  }
}
