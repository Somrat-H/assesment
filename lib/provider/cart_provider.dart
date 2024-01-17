import 'package:assesment/model/product_model.dart';
import 'package:flutter/material.dart';

import '../model/cart_model.dart';

class CartProvider with ChangeNotifier {

   List<CartModel> cartList = [];

  addCartProduct(List<ProductModel> product, index) {
    cartList.add(CartModel(product[index].image,
        product[index].name, product[index].price, 1));
  
  }
    @override
    notifyListeners();
  }
      
     

