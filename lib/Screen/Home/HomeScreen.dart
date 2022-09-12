import 'package:button_navigation_bar/button_navigation_bar.dart';
import 'package:button_navigation_bar/button_navigation_expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Components/DefaultButtonCostumeColor.dart';
import 'package:flutter_app/Controllers/Authentication.dart';
import 'package:flutter_app/Screen/Welcome/Login/LoginScreen.dart';
import 'package:flutter_app/Screen/Welcome/Register/Register_Screen.dart';
import 'package:flutter_app/constants.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
    switch (index) {
      case 1:
        {
          Navigator.pushNamed(context, HomeScreen.routeName);
        }
        break;
      default:
        {
          Navigator.pushNamed(context, HomeScreen.routeName);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text('SANJAYA Stationery'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
      body: Center(
        child: Text("Tab Index yang aktif : $_selectedNavbar",
            style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
