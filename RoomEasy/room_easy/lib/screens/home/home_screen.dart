
import 'package:flutter/material.dart';
import 'package:room_easy/screens/home/messages_screen.dart';
import 'package:room_easy/screens/home/profile_screen.dart';
import 'package:room_easy/screens/home/swipe_screen.dart';
import 'package:room_easy/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; //int that keeps track of which bottom navigation item is selected
  final AuthService _authService = AuthService();
  List<Widget> _widgetOptions = <Widget>[
    SwipeScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:_widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.account_box_rounded), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}