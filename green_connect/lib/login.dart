// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:green_connect/mentor/mentor_form.dart';
import 'package:green_connect/mentor/mentor_home.dart';
import 'package:green_connect/user/home.dart';

class ViewSelect extends StatefulWidget {
  @override
  State<ViewSelect> createState() => _ViewSelectState();
}

class _ViewSelectState extends State<ViewSelect> {
  String selectedOption = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GREEN CONNECT'),
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
                            'Choose one of the options below to get started.',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: ButtonSection(
                  selectedOption: selectedOption,
                  onOptionSelected: (option) {
                    setState(() {
                      selectedOption = option;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.lightGreen[200])),
                  onPressed: () {
                    if (selectedOption == 'guidance') {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => UserHome()));
                    } else if (selectedOption == 'mentor') {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MentorForm()));
                    }
                  },
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  final String selectedOption;
  final ValueChanged<String> onOptionSelected;

  ButtonSection({required this.selectedOption, required this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              onOptionSelected('guidance');
            },
            child: _buildButtonColumn(context, Icons.people,
                'I\'m looking for guidance', selectedOption == 'guidance'),
          ),
          GestureDetector(
            onTap: () {
              onOptionSelected('mentor');
            },
            child: _buildButtonColumn(context, Icons.laptop,
                'I want to be a mentor', selectedOption == 'mentor'),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonColumn(
      BuildContext context, IconData icon, String label, bool isSelected) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.green : Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: isSelected ? Colors.lightGreen[200] : Colors.black,
          ),
          SizedBox(width: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.green : Colors.black,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
