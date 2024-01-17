import 'package:assesment/model/cart_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cart extends StatelessWidget {
  List<CartModel> cardList = [];
  Cart({super.key, required this.cardList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: cardList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    textColor: Colors.blue.shade300,
                    title: Text(
                      cardList[index].name.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      cardList[index].qunatity.toString(),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    leading: Image.network(cardList[index].image.toString()),
                    trailing: Text(
                      "\$ ${cardList[index].price.toString()} ",
                      style: const TextStyle(fontSize: 20, color: Colors.amber),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
