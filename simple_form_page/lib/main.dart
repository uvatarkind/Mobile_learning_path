import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/sign_up.dart';
import 'pages/login.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sleep App',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF0099CC),
          secondary: const Color(0xFF8F6FF5),
          background: Colors.white,
          surface: Colors.white,
          onBackground: const Color(0xFF091B35),
          onSurface: const Color(0xFF091B35),
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFFAFAFA),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF8F6FF5), width: 1),
          ),
          hintStyle: const TextStyle(
            color: Color(0xFF8189B0),
            fontSize: 16,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0099CC),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF091B35),
          ),
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF091B35),
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF091B35),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFF091B35),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Color(0xFF091B35),
          ),
          labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF091B35),
          ),
        ),
      ),
      initialRoute: '/create-account',
      routes: {
        '/create-account': (context) => const CreateAccountScreen(),
        '/sign-in': (context) => const SignInScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}

