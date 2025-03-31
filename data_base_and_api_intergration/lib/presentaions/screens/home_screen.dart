import 'package:flutter/material.dart';
import '../../data/models/user.dart';
import '../../data/repositories/user_repository.dart';

class HomeScreen extends StatefulWidget {
  final UserRepository userRepository;

  const HomeScreen({
    Key? key,
    required this.userRepository,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<User>> _usersFuture;
  User? _savedUser;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Load saved user
      final savedUser = await widget.userRepository.getSavedUser();
      
      // Fetch users from API
      final usersFuture = widget.userRepository.getUsers();
      
      setState(() {
        _savedUser = savedUser;
        _usersFuture = usersFuture;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _saveUser(User user) async {
    await widget.userRepository.saveUser(user);
    setState(() {
      _savedUser = user;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User ${user.name} saved successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List App'),
      ),
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Saved user section
              if (_savedUser != null) ...[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Last Saved User:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text('Name: ${_savedUser!.name}'),
                      Text('Email: ${_savedUser!.email}'),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
              
              const Text(
                'User List:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 8.0),
              
              // User list
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : FutureBuilder<List<User>>(
                        future: _usersFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                    size: 60,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'No internet connection',
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: _loadData,
                                    child: const Text('Try Again'),
                                  ),
                                ],
                              ),
                            );
                          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Center(child: Text('No users found'));
                          } else {
                            final users = snapshot.data!;
                            return ListView.builder(
                              itemCount: users.length,
                              itemBuilder: (context, index) {
                                final user = users[index];
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 8.0),
                                  child: ListTile(
                                    title: Text(user.name),
                                    subtitle: Text(user.email),
                                    trailing: ElevatedButton(
                                      onPressed: () => _saveUser(user),
                                      child: const Text('Save'),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

