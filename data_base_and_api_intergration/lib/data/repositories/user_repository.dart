import '../models/user.dart';
import '../services/api_service.dart';
import '../services/storage_services.dart';

class UserRepository {
  final ApiService apiService;
  final StorageService storageService;

  UserRepository({
    required this.apiService,
    required this.storageService,
  });

  Future<List<User>> getUsers() async {
    try {
      return await apiService.getUsers();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveUser(User user) async {
    await storageService.saveUser(user);
  }

  Future<User?> getSavedUser() async {
    return await storageService.getSavedUser();
  }
}

