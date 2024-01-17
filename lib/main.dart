import 'package:assesment/provider/getproduct_provider.dart';
import 'package:assesment/provider/login_provider.dart';
import 'package:assesment/ui/screen/auth/login_screen.dart';
import 'package:assesment/ui/screen/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/cart_provider.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBin9DPGddNbuuGQLQR1CWUXf8cjYm9r24',
    appId: '1:420014344117:android:ff7147a74b6f7084b7fbfc',
    messagingSenderId: '420014344117',
    projectId: 'assesment-5f173',
    storageBucket: 'assesment-5f173.appspot.com',));
    

// Ideal time to initialize
// await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(
     MultiProvider(
      providers: [
        Provider<GetProdcutProvider>(create: (_)=>  GetProdcutProvider()),

        Provider<LoginProvider>(create: (_)=>  LoginProvider()),
        Provider<CartProvider>(create: (_)=>  CartProvider()),
      ],
   child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser != null ? const HomePage() : const LoginScreen(),
    );
  }
}
