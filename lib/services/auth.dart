import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class AuthBase {

  User? get currentUser;

  Stream<User?> authStateChanges();

  Future<User?> loginWithEmailAndPassword(String email, String password);
  Future<User?> signupWithEmailAndPassword(String email, String password);
  
  Future<User?> logout();
  
}


class Auth implements AuthBase {
  // late Future<User?> p;
  final _firebaseAuth = FirebaseAuth.instance;
    @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    final userAuth = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userAuth.user;
  }

  @override
  Future<User?> signupWithEmailAndPassword(String email, String password) async{
    final userAuth = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userAuth.user;
  }
  
  @override
  Stream<User?> authStateChanges() {
   return _firebaseAuth.authStateChanges();
  }
  
  @override
  User? get currentUser  {

  }
  
  @override
  Future<User?> logout() async{
      await _firebaseAuth.signOut();
  }
  


}