import 'package:assesment/model/product_model.dart';
import 'package:assesment/provider/getproduct_provider.dart';
import 'package:assesment/ui/screen/auth/login_screen.dart';
import 'package:assesment/ui/screen/product_details/product_deatils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetProdcutProvider _getProdcutProvider = GetProdcutProvider();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey =
        GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: Column(
                children: [
                  const CircleAvatar(),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()));
                    },
                    tileColor: Colors.blue.shade300,
                    leading: const Text("Logout"),
                    trailing: const Icon(Icons.logout),
                  )
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            icon: const Icon(Icons.menu)),
                        const Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: FutureBuilder<List<ProductModel>>(
                      future: _getProdcutProvider.getProduct(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => ProductDeatils(
                                                    product: snapshot.data!,
                                                    index: index)));
                                      },
                                      textColor: Colors.blue.shade300,
                                      title: Text(
                                        snapshot.data![index].name.toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        snapshot.data![index].details
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                      leading: Image.network(snapshot
                                          .data![index].image
                                          .toString()),
                                      trailing: Text(
                                        "\$ ${snapshot.data![index].price.toString()} ",
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.amber),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })),
            ],
          ),
        )));
  }
}
