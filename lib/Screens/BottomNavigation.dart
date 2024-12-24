import 'package:flutter/material.dart';
import 'package:hiremi/Screens/askexpert.dart';
import 'package:hiremi/Screens/drawer.dart';
import 'package:hiremi/Screens/jobs.dart';
import 'package:hiremi/Screens/settings.dart';
import 'package:hiremi/Screens/statusscreen.dart';
import 'package:hiremi/Screens/verified_home.dart';

class Navigation extends StatefulWidget {
  int currentindex; // Specify the type of the variable (e.g., int)

  Navigation({Key? key, required this.currentindex}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  // List of screens for each tab
  final List<Widget> _screens = [
    HomeScreen(),
    Jobs_Screen(
      index: 1,
    ),
    // Center(child: Text('Search Screen', style: TextStyle(fontSize: 24))),
    QueryFormScreen(),
    Statusscreen(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DrawerWidget(),
      body: _screens[widget.currentindex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentindex,
        onTap: (index) {
          setState(() {
            widget.currentindex = index; // Update the index
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: 'Ask Expert',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: '360',
          ),
        ],
      ),
    );
  }
}


//