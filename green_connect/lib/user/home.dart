// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_connect/chat.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

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
          MentorListTile(
            name: 'Katherine T.',
            description: 'Katherine specializes in corn and soybean crops.',
            category: 'Crops',
          ),
          MentorListTile(
            name: 'Jennifer W.',
            description: 'Hey there!I am an expert in soil composition and fertility.',
            category: 'Soil Health',
          ),
          MentorListTile(
            name: 'Michael S.',
            description: 'Im here to answer the questions you might have',
            category: 'Water Management',
          ),
          MentorListTile(
            name: 'Judy L.',
            description: 'I have 3 yrs experinece in pest management',
            category: 'Plant Health',
          ),
          ],
        ),
      )
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
        subtitle: Column(
          children: [
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
          
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
