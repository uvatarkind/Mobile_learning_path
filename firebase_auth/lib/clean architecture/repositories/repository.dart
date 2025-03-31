import '../models/user.dart';
import '../services/api.dart';
import '../services/storage.dart';

class UserRepository {
  final ApiService _apiService;
  final StorageService _localStorage;

  UserRepository({
    required ApiService apiService,
    required StorageService localStorage,
  })  : _apiService = apiService,
        _localStorage = localStorage;

  Future<List<User>> getUsers() async {
    return await _apiService.fetchUsers();
  }

  Future<void> saveUser(User user) async {
    await _localStorage.saveUser(user);
  }

  Future<User?> getSavedUser() async {
    return await _localStorage.getSavedUser();
  }
}