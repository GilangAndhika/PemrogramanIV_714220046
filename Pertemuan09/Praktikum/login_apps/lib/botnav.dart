import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'shared_pref.dart';

class DynamicBottomNavBar extends StatefulWidget {
  const DynamicBottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DynamicBottomNavBarState createState() => _DynamicBottomNavBarState();
}

class _DynamicBottomNavBarState extends State<DynamicBottomNavBar> {
  int _currentPageIndex = 0;

  // List of pages to display in the bottom navigation
  final List<Widget> _pages = <Widget>[
    const MyHome(),
    const MyShared(),
  ];

  // Method to handle tab switching
  void onTabTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display the currently selected page
      body: _pages[_currentPageIndex],

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex, // Highlight the selected tab
        onTap: onTabTapped, // Handle tab selection
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.last_page_rounded),
            label: 'Shared Preferences',
          ),
        ],
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
