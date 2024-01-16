import 'package:assesment/ui/screen/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyBin9DPGddNbuuGQLQR1CWUXf8cjYm9r24',
    appId: '1:420014344117:android:ff7147a74b6f7084b7fbfc',
    messagingSenderId: '420014344117',
    projectId: 'assesment-5f173',
    storageBucket: 'assesment-5f173.appspot.com',));

// Ideal time to initialize
// await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
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
