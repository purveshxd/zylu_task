import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zylu_assignment/firebase_options.dart';
import 'package:zylu_assignment/screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepOrange,
      ),
      home: const Homepage(),
    );
  }
}
