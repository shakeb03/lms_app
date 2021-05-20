import 'package:flutter/material.dart';
import 'package:lms_app/models/user_model.dart';

class UserTile extends StatelessWidget {
  
  final UserProfile user;
  UserTile({this.user}); 

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: EdgeInsets.only(top:8.0),
    //   child: Card(
    //     margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
    //     child: ListTile(
    //       leading: CircleAvatar(radius: 25.0,
    //       ),
    //       title: Text('name'),
    //       subtitle: Text(user.name),
    //     ),
    //   ),
    // );
    return Scaffold(
      body: 
        Container(padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        child:
              Container(
                color: Colors.grey[200],
                margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                  child: Center(
            child: Column(
              children:[
                SizedBox(height:20.0),
              Text('Name',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)
              ),
              SizedBox(height:10.0),
              Text(user.name),
              SizedBox(height:10.0), 
              Text('Department',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)
              ),
              SizedBox(height:10.0),
              Text(user.dept),
              SizedBox(height:10.0),
              Text('Phone Number',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)
              ),
              SizedBox(height:10.0),
              Text(user.phone),
              SizedBox(height:10.0),
                       ]
            ),
          ),
        ),
      ),
    );
  }
}