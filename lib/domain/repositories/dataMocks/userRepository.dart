import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  FirebaseAuth _firebaseAuth;

  UserRepository() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<UserCredential> createUserEmailPassword({
    @required String username,
    @required String userPassword,
    @required String userFullName,
  }) async {
    UserCredential userAuth;
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: username, password: userPassword)
        .then((value) => {userAuth = value})
        .catchError((e) => throw Exception(e.toString()));
    return userAuth;
  }

  Future<UserCredential> signInEmailPassword({
    @required String username,
    @required String userPassword,
  }) async {
    UserCredential userAuth;
    await _firebaseAuth
        .signInWithEmailAndPassword(email: username, password: userPassword)
        .then((value) => {userAuth = value})
        .catchError((e) => throw Exception(e.toString()));

    return userAuth;
  }

  Future<UserCredential> signInGoogleAcc() async {
    UserCredential loggedUser;
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount _googleAcc = await _googleSignIn.signIn();

    await _firebaseAuth
        .signInWithCredential(GoogleAuthProvider.credential(
            idToken: (await _googleAcc.authentication).idToken,
            accessToken: (await _googleAcc.authentication).accessToken))
        .then((value) => loggedUser = value)
        .catchError((e) => throw Exception(e.toString()));

    return loggedUser;
  }

  Future<bool> verifyIsLogged() async {
    bool isLogged;
    isLogged = _firebaseAuth.currentUser == null;
    return isLogged;
  }

  Future<User> getCurrentUser() async {
    User currentUser = _firebaseAuth.currentUser;
    return currentUser;
  }

  Future<void> signOut() async {
    await _firebaseAuth
        .signOut()
        .catchError((e) => throw Exception(e.toString()));
  }
}
