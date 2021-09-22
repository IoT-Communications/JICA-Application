import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jica/src/api/firebase/auth_api.dart';
import 'package:jica/src/utils/debugBro.dart';

class AuthService with ChangeNotifier {
  AuthApi authApi = AuthApi();
  bool _isLoading = false;

  Stream<User> get authStateChanges => authApi.authStateChanges;

  Future<void> signUp(String username, String email, String password) async {
    isLoading = true;
    await authApi.signUp(email: email, password: password, username: username);
    isLoading = false;
  }

  Future<void> signIn(String email, String password) async {
    isLoading = true;
    await authApi.signIn(email: email, password: password);
    isLoading = false;
  }

  void resetPassword() {}

  bool get isLoading => _isLoading;

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
