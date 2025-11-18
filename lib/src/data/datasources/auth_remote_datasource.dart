import 'package:flutter_basic/src/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String email, String password);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // TODO: Implement actual API calls using http or dio
  @override
  Future<UserModel> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'test@example.com' && password == 'password') {
      return const UserModel(
        id: '1',
        email: 'test@example.com',
        name: 'Test User',
      );
    } else {
      throw Exception('Invalid credentials');
    }
  }

  @override
  Future<UserModel> register(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'new@example.com') {
      throw Exception('User already exists');
    }
    return UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      name: 'New User',
    );
  }

  @override
  Future<void> logout() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    return;
  }
}
