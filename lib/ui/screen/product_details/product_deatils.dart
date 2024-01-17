// ignore_for_file: must_be_immutable

import 'package:assesment/model/product_model.dart';
import 'package:assesment/provider/cart_provider.dart';
import 'package:assesment/ui/screen/cart/cart.dart';
import 'package:assesment/ui/widget/custom_snakbar.dart';
import 'package:flutter/material.dart';

class ProductDeatils extends StatefulWidget {
  List<ProductModel> product = [];
  int index;
  ProductDeatils({super.key, required this.product, required this.index});

  @override
  State<ProductDeatils> createState() => _ProductDeatilsState();
}

class _ProductDeatilsState extends State<ProductDeatils> {
  CartProvider cartProvider = CartProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Product Details'),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              Cart(cardList: cartProvider.cartList)));
                },
                icon: const Icon(Icons.shopping_cart)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product Image
            Image.network(
              widget.product[widget.index].image.toString(),
              height: 200,
              fit: BoxFit.cover,
            ),
            // Product Name
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.product[widget.index].name.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Product Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.product[widget.index].details.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            // Product Price
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price: \$${widget.product[widget.index].price.toString()}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      cartProvider.addCartProduct(widget.product, widget.index);
                      // print(cartProvider.cartList.length.toString());
                      errorShow("Add product card successfully", context);
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
