// ignore: slash_for_doc_comments
/**
 * Purpose: Handles the authentication of the user
 * Interact: Firebase
 */

// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/models/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Create user object based on firebase user
  UserApp _userFromFirebaseUser(User? user) {
    if (user != null) {
      return UserApp(user.uid);
    } else {
      throw ('Error while returning user state');
    }
  }

  // ignore: slash_for_doc_comments
  /**
   * Creating User object from firebase user 
   * @return: null if the user sign out and 
   *          user object when sign in
   */
  Stream<UserApp> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebaseUser);
  }

  // Sign in annonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      print('result: ');
      return null;
    }
  }

  // Sign in with email & password

  // Register with email & password

  // Sign out
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
