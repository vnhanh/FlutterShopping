import 'model/user.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;

    return Future.delayed(
      const Duration(milliseconds: 500),
        () => _user = User('id_test'),
    );
  }
}