// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:green_connect/main.dart';
import 'package:green_connect/user/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height:50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network('https://img.freepik.com/free-vector/lines-cycle-leaf_78370-1735.jpg?w=740&t=st=1708115016~exp=1708115616~hmac=805d5cf8093d51c99c6d1d44d1729bac0f94ea33d4e2cd6ade541f377e70a1c7', height: 50),
                Text(
                  'GreenConnect',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Image.network('https://mir-s3-cdn-cf.behance.net/project_modules/fs/9ccde780669999.5ce79f75e0e25.jpg'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to sign up page
              },
              child: Text('Sign up for free'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(300, 50),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Sign in with Google
              },
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/google.png', height: 24),
                    SizedBox(width: 8),
                    Text('Continue with Google'),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.white,
                minimumSize: Size(300, 50),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Sign in with phone number
              },
              child: Text('Continue with phone number'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.white,
                minimumSize: Size(300, 50),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'By continuing, you agree to the Terms of Use. Read our Privacy Policy.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
