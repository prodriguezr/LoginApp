// Imports
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  // Constructor(s)
  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  // SignInWithGoogle
  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount gUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication gAuth = await gUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: gAuth.idToken, accessToken: gAuth.accessToken);

    await _firebaseAuth.signInWithCredential(credential);

    return _firebaseAuth.currentUser();
  }

  // SignInWithCredentials
  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // SignUp - Registro
  Future<void> signUp(String email, String password) {
    return _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  // SignOut
  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }

  // ¿Está logueado?
  Future<bool> isSignedIn() async {
    final FirebaseUser firebaseUser = await _firebaseAuth.currentUser();

    return firebaseUser != null;
  }

  // Obtener Usuario
  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).email;
  }
}
