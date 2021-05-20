import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lms_app/models/user_model.dart';
import 'package:lms_app/screens/home/user_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<Profile> {
  
  

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth= FirebaseAuth.instance;
    final User user = _auth.currentUser;
    final uid = user.uid.toString();
    final users = Provider.of<List<UserProfile>>(context);
    //final users = UserProfile();
    // return ListView.builder(
    //   itemCount: users.length,
    //   itemBuilder: (context,index){
    //     return UserTile(user:users[index]);
    //   },
    // );
    //accessing document
    Stream collectionStream = FirebaseFirestore.instance.collection('users').snapshots();
    Stream documentStream = FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
    print('this is the snapshots');
    print(documentStream);
      return UserTile(user:users.last);
  }
}