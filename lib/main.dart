import 'package:alfred/splash_screen.dart';
import 'package:flutter/material.dart';
import 'stepper_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false , 
      title: 'تطبيقي',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo', // Optional: Add a font like Cairo
      ),
       home: SplashScreen(),
    );
  }
}
