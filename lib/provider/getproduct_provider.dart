// ignore: unused_import
import 'package:assesment/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetProdcutProvider with ChangeNotifier {
  // late final ProductRepository productRepository;
  
 List<ProductModel> products = [];
  Future<List<ProductModel>> getProduct()async {
   
    
    FirebaseFirestore firestore = FirebaseFirestore.instance;
  
    QuerySnapshot qn = await firestore.collection("proudcts").get();

      for (int i = 0; i < qn.docs.length; i++) {
        products.add(ProductModel(
            details: qn.docs[i]["details"],
            image: qn.docs[i]["image"],
            name: qn.docs[i]["name"],
            price: qn.docs[i]["price"]));
      }
      ChangeNotifier();
      return products;
  }
}