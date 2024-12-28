import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    HomeScreen(
      isverified: false,
    ),
    Jobs_Screen(
      index: 1,
    ),
    QueryFormScreen(),
    Statusscreen(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        selectedItemColor:
            Color.fromARGB(255, 0, 117, 255), // Selected icon color
        unselectedItemColor: Colors.black54, // Unselected icon color
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/naviagtion/home.svg',
              color: widget.currentindex == 0
                  ? Color.fromARGB(255, 0, 117, 255)
                  : Colors.black54, // Adjust color based on selection
              fit: BoxFit.contain,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/naviagtion/jobs.svg',
              color: widget.currentindex == 1
                  ? Color.fromARGB(255, 0, 117, 255)
                  : Colors.black54, // Adjust color based on selection
              fit: BoxFit.contain,
            ),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/naviagtion/Group.svg',
              color: widget.currentindex == 2
                  ? Color.fromARGB(255, 0, 117, 255)
                  : Colors.black54, // Adjust color based on selection
              fit: BoxFit.contain,
            ),
            label: 'Ask Expert',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/naviagtion/status.svg',
              color: widget.currentindex == 3
                  ? Color.fromARGB(255, 0, 117, 255)
                  : Colors.black54, // Adjust color based on selection
              fit: BoxFit.contain,
            ),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/naviagtion/360.svg',
              fit: BoxFit.contain,
            ),
            label: '360',
          ),
        ],
      ),
    );
  }
}
