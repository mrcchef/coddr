import 'package:coddr/domain/usecases/get_emailId.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationDataSource {
  Future<void> signInWithCredentials(String email, String password);
  Future<void> signOut();
  bool isSignedIn();
  String getEmailId();
}

class AuthenticationDataSourceImpl extends AuthenticationDataSource {
  FirebaseAuth firebaseAuth;

  AuthenticationDataSourceImpl({@required this.firebaseAuth});

  @override
  Future<void> signInWithCredentials(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUpWithCredentials(String email, String password) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  bool isSignedIn() {
    final currentUser = firebaseAuth.currentUser;
    if (currentUser == null) return false;
    return true;
  }

  String getEmailId() {
    return firebaseAuth.currentUser.email;
  }
}
