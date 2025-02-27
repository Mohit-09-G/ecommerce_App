import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> createAccount(String username, String password);
  Future<Map> signInWithEmailAndPassword(String username, String password);
}
