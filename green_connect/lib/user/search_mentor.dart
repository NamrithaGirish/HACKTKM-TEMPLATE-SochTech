// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_connect/api/api_constants.dart';
import 'package:green_connect/api/api_services.dart';
import 'package:green_connect/user/home.dart';
import 'package:green_connect/user/user_profile.dart';

class MentorPage extends StatefulWidget {
  const MentorPage({Key? key}) : super(key: key);

  @override
  State<MentorPage> createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> {
  final TextEditingController searchController = TextEditingController();
  int _selectedIndex = 0;
  int length = 0;
  List<dynamic>? mentors;
  List<dynamic>? mentor;
  int lengths = 0;

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
      Future<List<dynamic>?> user = ApiService().getPrevMent(ApiConstants.id);
      Future<List<dynamic>?> users = ApiService().otherMentors();
      List<dynamic>? values = await users;
      List<dynamic>? value = await user;
      if (value != null && values!=null) {
        setState(() {
          length = value.length;
          mentors = value;
          lengths = values.length;
          mentor = values;
          print("hereeee"+mentor![0]);
        });
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> _setProfileOthers() async {
    try {
      Future<List<dynamic>?> users = ApiService().otherMentors();
      List<dynamic>? values = await users;
      if (values != null) {
        setState(() {
          lengths = values.length;
          mentor = values;
          print("hereeee"+mentor![0]);
        });
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setProfile();
    _setProfileOthers();
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
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: GoogleFonts.jura(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Color.fromARGB(255, 0, 0, 0),
                )),
                textAlign: TextAlign.center,
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Color(0xFFF2F5F0),
                  hintText: "Search for mentors",
                  hintStyle: GoogleFonts.jura(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                  )),
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Previously Contacted',
                style: GoogleFonts.jura(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                  color: Color.fromARGB(255, 0, 0, 0),
                )),
              ),
            ),
            Container(
              height: 125,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < length; i++) ...[
                    MentorCard(
                      name: mentors![i]["name"],
                      category: mentors![i]["domain"],
                    ),
                  ],
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('All Mentors'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('By Expertise'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('By Plant Type'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('By Name'),
                    ),
                  ],
                ),
              ),
            ),
           Column(
            
  children: [
    for (int i = 0; i < lengths; i++) ...[
                    MentorListTile(
                      name: mentor![i]["name"],
                      category: mentor![i]["domain"],
                      description: mentor![i]["description"],
                    ),
                  ],
    ],
),

            
            
          ],
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
        ));
  }
}

class MentorCard extends StatelessWidget {
  final String name;
  final String category;
  const MentorCard({
    Key? key,
    required this.name,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Text(
                name[0],
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Category: $category',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MentorListTile extends StatelessWidget {
  final String name;
  final String description;
  final String category;
  const MentorListTile({
    Key? key,
    required this.name,
    required this.description,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey,
        child: Text(
          name[0],
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        children: [
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            'Category: $category',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
