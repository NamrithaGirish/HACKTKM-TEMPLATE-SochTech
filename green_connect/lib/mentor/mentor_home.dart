// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_connect/chat.dart';

class MentorHome extends StatefulWidget {
  const MentorHome({Key? key}) : super(key: key);

  @override
  State<MentorHome> createState() => _MentorHomeState();
}

class _MentorHomeState extends State<MentorHome> {

  final TextEditingController searchController=TextEditingController();

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
      body:SingleChildScrollView(
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Green Connect',
              style: GoogleFonts.jura(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )
                    ),
            ),
          ),
          SizedBox(height:20),
          Container(width:MediaQuery.of(context).size.width,height:2,color: Colors.grey,),
          SizedBox(height:20),
          Text(
              'Current Clients',
              style: GoogleFonts.jura(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )
                    ),
            ),
            SizedBox(height:20),
          MentorListTile(
            name: 'Katherine T.',
            description: 'Katherine specializes in corn and soybean crops.',
            category: 'Crops',
          ),
          SizedBox(height:10),
          MentorListTile(
            name: 'Jennifer W.',
            description: 'Hey there!I am an expert in soil composition and fertility.',
            category: 'Soil Health',
          ),
          SizedBox(height:10),
          MentorListTile(
            name: 'Michael S.',
            description: 'Im here to answer the questions you might have',
            category: 'Water Management',
          ),
          SizedBox(height:10),
          MentorListTile(
            name: 'Judy L.',
            description: 'I have 3 yrs experinece in pest management',
            category: 'Plant Health',
          ),

          SizedBox(height: 20,),
          Text(
              'Previous Clients',
              style: GoogleFonts.jura(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )
                    ),
            ),
            SizedBox(height:20),
            Container(
            height: 125,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                MentorCard(
                  name: 'Katherine T.',
                  category: 'Crops',
                ),
                MentorCard(
                  name: 'Jennifer W.',
                  category: 'Soil Health',
                ),
                MentorCard(
                  name: 'Michael S.',
                  category: 'Water Management',
                ),
                MentorCard(
                  name: 'Judy L.',
                  category: 'Plant Health',
                ),
              ],
            ),
          ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        fixedColor: Colors.black,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'My garden',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Plantbook',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],)
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
    return GestureDetector(
      child: ListTile(
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
        
        trailing: Text(
          '10:30 AM',
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatUI()));
      },
    );
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
                'K',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Katherine',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}