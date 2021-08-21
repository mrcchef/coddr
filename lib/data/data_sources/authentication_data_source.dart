import 'package:coddr/domain/usecases/get_emailId.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationDataSource {
  Future<void> signInWithCredentials(String email, String password);
  Future<void> signOut();
  bool isSignedIn();
  String getEmailId();
  String getUid();
  Future<void> signUpWithCredentials(String email, String password);
}

class AuthenticationDataSourceImpl extends AuthenticationDataSource {
  FirebaseAuth firebaseAuth;

  AuthenticationDataSourceImpl({@required this.firebaseAuth});

  @override
  Future<void> signInWithCredentials(String email, String password) async {
    final UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(userCredential);
  }

  @override
  Future<void> signUpWithCredentials(String email, String password) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  String getUid() {
    return firebaseAuth.currentUser.uid;
  }

  @override
  Future<void> signOut() async {
    print("before: ${firebaseAuth.currentUser.uid}");
    await firebaseAuth.signOut();
    print("after: ${firebaseAuth.currentUser.uid}");
  }

  @override
  bool isSignedIn() {
    final currentUser = firebaseAuth.currentUser;
    if (currentUser == null) return false;
    return true;
  }

  @override
  String getEmailId() {
    return firebaseAuth.currentUser.email;
  }

  Future<void> verifyEmail() async {
    await firebaseAuth.currentUser.sendEmailVerification();
  }

  bool isEmailVerified() {
    return firebaseAuth.currentUser.emailVerified;
  }
}
