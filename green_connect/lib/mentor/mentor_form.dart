import 'package:flutter/material.dart';

class MentorForm extends StatefulWidget {
  const MentorForm({Key? key}) : super(key: key);

  @override
  _MentorFormState createState() => _MentorFormState();
}

class _MentorFormState extends State<MentorForm> {
  // Declare the controllers for the input fields
  final locationController = TextEditingController();
  final companyController = TextEditingController();
  final titleController = TextEditingController();
  final backgroundController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed from the widget tree
    locationController.dispose();
    companyController.dispose();
    titleController.dispose();
    backgroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galileo design'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mentor assessment',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tell us about yourself',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const Text(
              'We\'ll use this information to match you with mentees who need your help.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Create a text field for the location input
            TextField(
              controller: locationController,
              decoration: const InputDecoration(
                labelText: 'Location',
                hintText: 'San Francisco Bay Area',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            // Create a text field for the company input
            TextField(
              controller: companyController,
              decoration: const InputDecoration(
                labelText: 'Company',
                hintText: 'Google Inc. (2010-2021)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            // Create a text field for the title input
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Product manager',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            // Create a text field for the professional background input
            TextField(
              controller: backgroundController,
              decoration: const InputDecoration(
                labelText: 'Professional background',
                hintText: 'Tell us about your skills and experience',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            // Create a button to continue to the next screen
            ElevatedButton(
              onPressed: () {
                // TODO: Implement the logic to submit the form and navigate to the next screen
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
