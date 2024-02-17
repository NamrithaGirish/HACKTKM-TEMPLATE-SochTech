// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:green_connect/user/home.dart';
import 'package:green_connect/user/search_mentor.dart';
import 'package:green_connect/user/user_profile.dart';

class MentorProfile extends StatefulWidget {
  const MentorProfile({Key? key}) : super(key: key);

  @override
  State<MentorProfile> createState() => _MentorProfileState();
}

class _MentorProfileState extends State<MentorProfile> {
  int _selectedIndex = 0;

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
          title: Text('Mentor Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://th.bing.com/th/id/R.50bfb50cc7e156ccca8dc6258047aca4?rik=xT8mAi9txYwWkw&riu=http%3a%2f%2fpelaez.fabianramirez.co%2fwp-content%2fuploads%2f2017%2f02%2fteam-2.jpg&ehk=HOHEsSS9yxRwVSSi%2bJLx0Mk%2fBYNm2qj8asedsPwwbkI%3d&risl=&pid=ImgRaw&r=0',)
        ,
              ),
              SizedBox(height: 10),
              Text(
                'Gloria Kim',
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
              SizedBox(
                height: 20,
              ),
              Text(
                'About',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'I\'m an agricultural engineer at Google. I specialize in sustainable farming, crop management, and technology in agriculture. I\'m passionate about mentoring and sharing my knowledge to support the next generation of agri-tech leaders.',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              SizedBox(height: 20),
              
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          fixedColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'My garden',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
