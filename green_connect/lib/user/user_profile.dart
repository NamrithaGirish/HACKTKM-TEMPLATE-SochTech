// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:green_connect/api/api_services.dart';
import 'package:green_connect/user/home.dart';
import 'package:green_connect/user/search_mentor.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  int _selectedIndex = 0;
  String name='';

  @override
  void initState() {
    // TODO: implement initState
    _setProfile();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Perform different actions based on the selected index
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => UserHome()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MentorPage()));
        print('Search tapped');
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => UserProfilePage()));
        print('Profile tapped');
        break;
    }
  }

  Future<void> _setProfile() async {
    try {
      Future<Map<String, dynamic>?> user = ApiService().getUserByID(1);
      Map<String, dynamic>? value = await user;
      if (value != null) {
        setState(() {
          name=value['name'];
        });
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('User Details'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            '@gloria.kim',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          Text(
            'San Francisco, CA',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
          Text(
              'Description',
              style: TextStyle(fontSize: 14,color: Colors.grey),
            ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('gloria.kim@gmail.com'),
                ),
                
              ],
            ),
          ),
          
          SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          fixedColor: Colors.black,
          // currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'My garden',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        )
    );
  }
}
