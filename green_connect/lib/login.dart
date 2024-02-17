import 'package:flutter/material.dart';
import 'package:green_connect/mentor/mentor_home.dart';
import 'package:green_connect/mentor/mentor_profile.dart';
import 'package:green_connect/user/home.dart';
import 'package:green_connect/user/user_profile.dart';


class ViewSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Choose your role'),
          backgroundColor: Colors.lightGreen[200],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Are you looking for guidance or willing to provide it?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Choose one of the options below to get started.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                child: ButtonSection()),
              
            ],
          ),
        ),
      ),
    );
  }
}


class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserHome()));},child: _buildButtonColumn(context, Icons.people, 'I\'m looking for guidance')),
          GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MentorHome()));},child: _buildButtonColumn(context, Icons.laptop, 'I want to be a mentor')),
        ],
      ),
    );
  }

  Widget _buildButtonColumn(BuildContext context, IconData icon, String label) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,  // Adjust the size as per your requirement
          color: Colors.lightGreen[200],  // Add your desired color
        ),
        SizedBox(width: 20,),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    ),
  );
}
}



