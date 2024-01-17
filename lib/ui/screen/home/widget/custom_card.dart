import 'package:assesment/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../product_details/product_deatils.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  List<ProductModel> products;
  CustomCard({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductDeatils(product: products, index: index)));
                            },
                            textColor: Colors.blue.shade300,
                            title: Text(
                              products[index].name.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              products[index].details.toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            leading: Image.network(
                                products[index].image.toString()),
                            trailing: Text(
                              "\$ ${products[index].price.toString()} ",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.amber),
                            ),
                          ),
                        ),
                      );
                    });
  }
}