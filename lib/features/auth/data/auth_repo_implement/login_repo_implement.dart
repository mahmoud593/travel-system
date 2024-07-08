import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_system/features/auth/data/auth_repo/login_repo.dart';

class LoginRepoImplement extends LoginRepo{
  @override
  Future<void> login({required String email, required String password}) async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}