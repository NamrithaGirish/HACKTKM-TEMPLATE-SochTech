import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_responsive/flutter_responsive.dart';

// A custom widget class to represent a menu item
class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}

// A custom widget class to represent the admin panel UI
class AdminPanelUI extends StatefulWidget {
  const AdminPanelUI({Key? key}) : super(key: key);

  @override
  _AdminPanelUIState createState() => _AdminPanelUIState();
}

class _AdminPanelUIState extends State<AdminPanelUI> {
  // A list of sample menu items
  final List<Map<String, dynamic>> menuItems = [
    {
      'icon': Icons.person,
      'title': 'User profile views',
      'subtitle': 'Profile views, followings',
    },
    {
      'icon': Icons.abc,
      'title': 'User activity',
      'subtitle': 'Posts, shares, likes',
    },
    {
      'icon': Icons.flag,
      'title': 'Flagged content',
      'subtitle': 'Content that was flagged',
    },
    {
      'icon': Icons.bar_chart,
      'title': 'Usage stats',
      'subtitle': 'User statistics',
    },
  ];

  // A variable to store the current index of the bottom navigation bar
  int _currentIndex = 0;

  // A method to handle the bottom navigation bar item selection
  void _onItemTapped(int index) {
    // Set the current index to the selected index
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // display the header with the title and the settings icon
        title: const Text('Admin'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // TODO: handle the settings button press
            },
          ),
        ],
      ),
      body: ListView.builder(
        // display the menu items in a list view
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          // Get the menu item data
          final Map<String, dynamic> menuItem = menuItems[index];

          // Return a menu item widget
          return MenuItem(
            icon: menuItem['icon'] as IconData,
            title: menuItem['title'] as String,
            subtitle: menuItem['subtitle'] as String?,
            onTap: () {
              // TODO: handle the menu item tap
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        // display the bottom navigation bar with five icons
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.connect_without_contact),
            label: 'Connect',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}
