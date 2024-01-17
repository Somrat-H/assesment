import 'package:flutter/material.dart';

import '../../../../model/product_model.dart';
import '../../product_details/product_deatils.dart';

// ignore: must_be_immutable
class CustomWidget extends StatelessWidget {
  List<ProductModel> products;
  CustomWidget({super.key,  required this.products});
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
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
                        );
  }
}