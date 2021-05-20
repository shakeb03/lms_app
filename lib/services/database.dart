import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lms_app/models/user_model.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  Future updateUserPersonalData(String name, String dept, String phone,int casual,int medical, int earned) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'dept': dept,
      'phone': phone,
      'casual': casual,
      'medical': medical,
      'earned': earned
    });
  
   }

  //profile list from snapshot
  List<UserProfile> _UserProfileListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return UserProfile(
        name: doc.data()['name'] ?? '',
        phone: doc.data()['phone'] ?? '',
        dept: doc.data()['dept'] ?? '',
      );
    }).toList();
  }

  //get user stream
  Stream<List<UserProfile>> get users{
    return userCollection.snapshots()
      .map(_UserProfileListFromSnapshot);
  }
}