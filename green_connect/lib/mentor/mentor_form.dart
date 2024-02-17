import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class MentorForm extends StatefulWidget {
  const MentorForm({Key? key}) : super(key: key);

  @override
  _MentorFormState createState() => _MentorFormState();
}

class _MentorFormState extends State<MentorForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();
  final domainController = TextEditingController();
  final descriptionController = TextEditingController();
  String? resumePath; // To store the path of the selected resume file

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    locationController.dispose();
    domainController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Green Connect'),
      ),
      backgroundColor: Colors.white54,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circular area for uploading photo
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'assets/images/user.png',
                  ),
                ),
              ),
              const SizedBox(height: 16),
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
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'John Doe',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'john.doe@example.com',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(
                  labelText: 'Location',
                  hintText: 'San Francisco Bay Area',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: domainController,
                decoration: const InputDecoration(
                  labelText: 'Domain',
                  hintText: 'Software Engineering, Marketing, etc.',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Tell us about your expertise and mentoring approach',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  // Pick a file (resume)
                  String? filePath = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf', 'doc', 'docx'], // Specify allowed file types
                  ).then((result) => result?.files.single.path);

                  if (filePath != null) {
                    // File picked successfully
                    setState(() {
                      resumePath = filePath;
                    });
                  }
                },
                child: const Text('Upload Resume'),
              ),
              const SizedBox(height: 16),
              // Display the selected resume path (for demonstration purposes)
              Text(
                'Resume Path: ${resumePath ?? "No file selected"}',
                style: TextStyle(color: Colors.blue),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement the logic to submit the form and navigate to the next screen
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
