import 'package:flutter/material.dart';
import 'package:green_connect/chat.dart';
import 'package:green_connect/user/search_mentor.dart';
import 'package:green_connect/user/user_profile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmers First'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Search functionality
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Welcome to Farmers First',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: 'Pick your mentor',
            image: 'assets/images/plant.jpg',
            description:
                'Get advice from experienced farmers, gardeners, and chefs.',
            buttonText: 'Select mentor',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MentorPage()));// Navigate to mentor selection page
            },
          ),
          SectionCard(
            title: 'Agriculture plans',
            image: 'assets/images/plant.jpg',
            description: 'Grow your own food with our step-by-step plans.',
            buttonText: 'Start a plan',
            onPressed: () {
              // Navigate to plan selection page
            },
          ),
          SectionCard(
            title: 'Chat with us',
            image: 'assets/images/plant.jpg',
            description: 'Have questions about growing? Chat with our team.',
            buttonText: 'Chat now',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatUI()));// Navigate to chat page
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  [
          BottomNavigationBarItem(
            icon: GestureDetector(child: Icon(Icons.person,color: Colors.black,),onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserProfilePage()));},),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,color: Colors.black,),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people,color: Colors.black,),
            label: 'Mentor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list,color: Colors.black,),
            label: 'Plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat,color: Colors.black,),
            label: 'Chat',
          ),
        ],
        currentIndex: 0, // Change this to reflect the current page
        onTap: (index) {
          // Navigate to the selected page
        },
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;
  const SectionCard({
    Key? key,
    required this.title,
    required this.image,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(image, height: 200, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  child: Text(buttonText),
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
