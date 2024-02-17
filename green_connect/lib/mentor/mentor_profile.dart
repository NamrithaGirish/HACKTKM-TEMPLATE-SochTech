// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MentorProfile extends StatelessWidget {
  const MentorProfile({Key? key}) : super(key: key);

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
              backgroundImage: AssetImage('assets/images/avatar.png'),
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
            SizedBox(height: 20,),
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'I\'m an agricultural engineer at Google. I specialize in sustainable farming, crop management, and technology in agriculture. I\'m passionate about mentoring and sharing my knowledge to support the next generation of agri-tech leaders.',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text('Current Clients',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
      leading: CircleAvatar(
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
      title: Text(
        'Katherine',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
                  ListTile(
      leading: CircleAvatar(
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
      title: Text(
        'Katherine',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
                  ListTile(
      leading: CircleAvatar(
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
      title: Text(
        'Katherine',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
