// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:green_connect/api/api_services.dart';
import 'package:green_connect/mentor/mentor_quiz.dart';
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
  String name = '';
  String location = '';
  String desc = '';
  String _currentQuizLevel =
      ''; // Add a variable to store the current quiz level
  Future<void> _setProfile() async {
    try {
      Future<List<dynamic>?> user = ApiService().getUserByID(1);
      List<dynamic>? value = await user;
      if (value != null) {
        setState(() {
          name = value[0]["name"];
          location = value[0]["location"];
          desc = value[0]["description"];
        });
      }
    } catch (error) {
      print(error);
    }
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

  @override
  void initState() {
    // TODO: implement initState
    _setProfile();
    super.initState();
  }

  void _startQuiz(String level) {
    // TODO: Implement quiz logic for the selected level
    // You can add the logic to navigate to the quiz screen or perform any other actions
    _currentQuizLevel = level; // Set the current level
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
              backgroundImage: AssetImage('assets/images/plant.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              location,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 20),
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              desc,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            SizedBox(height: 30),
            Text(
              'Quiz',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Container for Quiz Levels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MentorQuiz(
                            title:
                                'Beginner Quiz'))); // TODO: Implement quiz logic for beginner level
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  ),
                  child: Text('Beginner Quiz', style: TextStyle(fontSize: 12)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            MentorQuiz(title: 'Intermediate Quiz')));
                    // TODO: Implement quiz logic for intermediate level
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  ),
                  child:
                      Text('Intermediate Quiz', style: TextStyle(fontSize: 12)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            MentorQuiz(title: 'Expert Quiz')));
                    // TODO: Implement quiz logic for expert level
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  ),
                  child: Text('Expert Quiz', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Current Quiz Level: $_currentQuizLevel', // Display current level
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
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
      ),
    );
  }
}
