import 'package:flutter/material.dart';
import 'data/repositories/user_repository.dart';
import 'data/services/api_service.dart';
import 'data/services/storage_services.dart';
import 'presentaions/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize services and repository
    final apiService = ApiService();
    final storageService = StorageService();
    final userRepository = UserRepository(
      apiService: apiService,
      storageService: storageService,
    );

    return MaterialApp(
      title: 'User List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: HomeScreen(userRepository: userRepository),
    );
  }
}

