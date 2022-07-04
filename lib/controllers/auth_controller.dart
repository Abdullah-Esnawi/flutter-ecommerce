import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/utilities/enums.dart';
import 'package:flutter/cupertino.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthFormType authFormType;

  AuthController(
      {required this.auth,
      this.email = '',
      this.authFormType = AuthFormType.login,
      this.password = ''});

  void updatePassword(String password) {
    return copyWith(password: password);
  }

  void updateEmail(String email) {
    return copyWith(email: email);
  }

  toggleFormType() {
    final formType = authFormType == AuthFormType.login
        ? AuthFormType.register
        : AuthFormType.login;
    copyWith(email: '', password: '', authFormType: formType);
  }

  void copyWith({String? email, AuthFormType? authFormType, String? password}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }

  Future<void> submit() async {
    try {
      if (authFormType == AuthFormType.login) {
        await auth.loginWithEmailAndPassword(email, password);
      } else {
        await auth.signupWithEmailAndPassword(email, password);
      }
    } catch (err) {
      rethrow;
    }
  }
}
