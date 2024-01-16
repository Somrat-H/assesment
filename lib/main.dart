import 'package:assesment/ui/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(const MyApp());
}

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// // ...

// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
