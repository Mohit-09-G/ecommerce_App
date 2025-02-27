import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> createAccount(String username, String password);
  Future<Map<String, dynamic>> signInWithEmailandPassword(
      String username, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserCredential> createAccount(String username, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: username, password: password);
      return userCredential;
    } catch (e) {
      throw Exception('Failed to create account: ${e.toString()}');
    }
  }

  @override
  Future<Map<String, dynamic>> signInWithEmailandPassword(
      String username, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: username, password: password);

      final User? user = userCredential.user;
      if (user != null) {
        Map<String, dynamic> userData = {
          "uid": user.uid,
          "email": user.email,
        };
        return {"status": "success", "user": user, "userData": userData};
      } else {
        return {"status": "error", "message": "Failed to sign in."};
      }
    } catch (e) {
      return {"status": "error", "message": e.toString()};
    }
  }
}
