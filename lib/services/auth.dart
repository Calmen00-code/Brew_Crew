// ignore: slash_for_doc_comments
/**
 * Purpose: Handles the authentication of the user
 * Interact: Firebase
 * @associate FirebaseAuth Object
 */

import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/models/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      // Create a new document for the user with the uid in the database
      await DatabaseService(uid: user!.uid)
          .updateUserData('0', 'new crew member', 100);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

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
