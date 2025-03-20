import 'package:flutter/material.dart';
import 'pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3B45AD),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3B45AD),
          primary: const Color(0xFF3B45AD),
        ),
        fontFamily: 'Poppins',
      ),
      home: const ProfileScreen(),
    );
  }
}

