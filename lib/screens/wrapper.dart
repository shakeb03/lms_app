import 'package:flutter/material.dart';
import 'package:lms_app/screens/authenticate/authenticate.dart';
import 'package:lms_app/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:lms_app/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    
    //return home or authenticate
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}