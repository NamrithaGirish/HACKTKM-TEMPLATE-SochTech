// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:green_connect/login.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/bg.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // Other widgets
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo and app name
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.network(
                      //   'https://img.freepik.com/free-vector/lines-cycle-leaf_78370-1735.jpg?w=740&t=st=1708115016~exp=1708115616~hmac=805d5cf8093d51c99c6d1d44d1729bac0f94ea33d4e2cd6ade541f377e70a1c7',
                      //   height: 64.0,
                      //   width: 64.0,
                      // ),
                      Text(
                        'Green Connect',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width/9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Tagline
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Your Garden Your Way',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                // Login button
                SizedBox(height: 100,),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewSelect()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google.png', // Replace with your image asset path
                        height: 24.0,
                        width: 24.0,
                      ),
                      SizedBox(width: 8.0), // Adjust the spacing between the image and text
                      Text(
                        'Sign in with Google',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                    style: ElevatedButton.styleFrom(
                      
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      //padding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
                // Sign up button
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
