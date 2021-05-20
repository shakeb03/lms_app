import 'package:flutter/material.dart';
import 'package:lms_app/services/auth.dart';
import 'package:lms_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:lms_app/screens/home/profile.dart';
import 'package:lms_app/models/user_model.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int _selectedIndex = 0;
  static const TextStyle optionstyle = 
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'INDEX 0: home',
      style: optionstyle,
    ),
    Text(
      'INDEX 1: add',
      style: optionstyle,
    ),
    //Profile page container displays profie page
    Profile(),
  ];

  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserProfile>>.value(
        value: DatabaseService().users,
        child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Home Screen'),
          backgroundColor: Colors.grey[600],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign Out'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue[200],
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
              backgroundColor: Colors.blue[200],
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.blue[200],
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        )
      ),
    );
  }
}