import 'package:firebase_auth/firebase_auth.dart';
import 'package:third_app/data/api/auth_remote_data_source.dart';
import 'package:third_app/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSourceImpl remotedatasource;

  AuthRepositoryImpl({required this.remotedatasource});
  @override
  Future<User?> createAccount(String username, String password) async {
    try {
      final userCredential =
          await remotedatasource.createAccount(username, password);
      return userCredential.user;
    } catch (e) {
      throw Exception('Repository: Failed to create account: ${e.toString()}');
    }
  }

  @override
  Future<Map<String, dynamic>> signInWithEmailAndPassword(
      String username, String password) async {
    try {
      final result =
          await remotedatasource.signInWithEmailandPassword(username, password);
      if (result["status"] == "success") {
        return {'success': true, 'user': result['user']};
      } else {
        return {'success': false, 'message': 'Failed to sign in'};
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Failed to sign in: ${e.toString()}'
      };
    }
  }
}
