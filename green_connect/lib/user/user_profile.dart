// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

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
    );
  }
}
