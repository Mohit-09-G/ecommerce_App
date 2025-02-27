import 'package:third_app/domain/repositories/auth/auth_repository.dart';

class DoLoginWithEmailPassword {
  final AuthRepository repository;

  DoLoginWithEmailPassword({required this.repository});

  Future<Map<String, dynamic>> execute(String username, String password) async {
    final result =
        await repository.signInWithEmailAndPassword(username, password);
    return Map<String, dynamic>.from(result);
  }
}
