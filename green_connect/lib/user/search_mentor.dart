// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MentorPage extends StatefulWidget {
  const MentorPage({Key? key}) : super(key: key);

  @override
  State<MentorPage> createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> {

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
                      )
                    ),
                  textAlign: TextAlign.center,
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor:Color(0xFFF2F5F0),
                      hintText: "Search for mentors",
                      hintStyle: GoogleFonts.jura(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )
                    ),
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
                      )
                    ),
            ),
          ),
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
          MentorListTile(
            name: 'Katherine T.',
            description: 'Katherine specializes in corn and soybean crops.',
            category: 'Crops',
          ),
          MentorListTile(
            name: 'Jennifer W.',
            description: 'Jennifer is an expert in soil composition and fertility.',
            category: 'Soil Health',
          ),
          MentorListTile(
            name: 'Michael S.',
            description: 'Michael has extensive experience in irrigation and drainage.',
            category: 'Water Management',
          ),
          MentorListTile(
            name: 'Judy L.',
            description: 'Judy is a botanist specializing in plant diseases and pest management.',
            category: 'Plant Health',
          ),
        ],
      ),
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
