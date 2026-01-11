import '../models/user.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  User? _currentUser;
  User? get currentUser => _currentUser;

  // Simple in-memory user store for demo purposes
  final Map<String, String> _users = {
    'test@library.com': 'password123',
  };

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (_users.containsKey(email) && _users[email] == password) {
      _currentUser = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: email.split('@')[0],
        email: email,
        borrowedBookIds: [],
      );
      return true;
    }
    return false;
  }

  Future<bool> register(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (!_users.containsKey(email) && email.contains('@')) {
      _users[email] = password;
      _currentUser = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        email: email,
        borrowedBookIds: [],
      );
      return true;
    }
    return false;
  }

  void logout() {
    _currentUser = null;
  }
}
