import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // Collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  // Adding new user to the database
  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // Get brews stream from database
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }

  // Get Brew List from database
  /*
  List<UserApp> brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return (
        name: doc.data()!['name'],
        strength: doc.data()!['strength'],
        sugars: doc.data()!['sugars'],
      );
    }).toList();
  }*/
}
