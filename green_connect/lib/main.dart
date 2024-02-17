import 'package:flutter/material.dart';
import 'package:green_connect/admin.dart';
import 'package:green_connect/chat.dart';
import 'package:green_connect/mentor/mentor_form.dart';
import 'package:green_connect/mentor/mentor_quiz.dart';
import 'package:green_connect/signup.dart';
import 'package:green_connect/user/search_mentor.dart';
import 'package:green_connect/user/user_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignUp(),
    );
  }
} 
