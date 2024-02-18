import 'package:flutter/material.dart';

class MentorQuiz extends StatefulWidget {
  const MentorQuiz({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MentorQuizState createState() => _MentorQuizState();
}

class _MentorQuizState extends State<MentorQuiz> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  // Define the initial values for the form fields.
  int _years = 1;
  bool _degree = false;
  bool _certification = false;
  bool _sustainable = false;
  bool _hydroponics = false;
  String _experience = '';

  // Define the list of options for the radio buttons.
  List<int> _yearsOptions = [1, 2, 3, 4, 5];

  // Define a function that updates the state when a radio button is selected.
  void _setYears(int value) {
    setState(() {
      _years = value;
    });
  }

  // Define a function that updates the state when a checkbox is toggled.
  void _toggleCheckbox(bool value, String name) {
    setState(() {
      switch (name) {
        case 'degree':
          _degree = value;
          break;
        case 'certification':
          _certification = value;
          break;
        case 'sustainable':
          _sustainable = value;
          break;
        case 'hydroponics':
          _hydroponics = value;
          break;
      }
    });
  }

  // Define a function that validates and submits the form.
  void _submitForm() {
    // Validate the form fields.
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar with the input data.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Years: $_years\nDegree: $_degree\nCertification: $_certification\nSustainable: $_sustainable\nHydroponics: $_hydroponics\nExperience: $_experience'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Agriculture Knowledge Assessment',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Please answer the following questions to help us validate your account. Your self-assessment will be used to assess your knowledge in the field of agriculture.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'How many years have you worked in the agriculture industry?',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Row(
                    children: _yearsOptions.map((int value) {
                      return Expanded(
                        child: RadioListTile<int>(
                          value: value,
                          groupValue: _years,
                          onChanged: (int? selectedValue) {
                            _setYears(selectedValue ??
                                0); // Default to 0 if selectedValue is null
                          },
                          title: Text('$value'),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Do you have a degree in agriculture or a related field?',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  CheckboxListTile(
                    value: _degree,
                    onChanged: (bool? value) {
                      _toggleCheckbox(value!, 'degree');
                    },
                    title: Text('Yes'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Do you have any certifications in agriculture?',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  CheckboxListTile(
                    value: _certification,
                    onChanged: (bool? value) {
                      _toggleCheckbox(value!, 'certification');
                    },
                    title: Text('Yes'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Do you have experience in sustainable farming?',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  CheckboxListTile(
                    value: _sustainable,
                    onChanged: (bool? value) {
                      _toggleCheckbox(value!, 'sustainable');
                    },
                    title: Text('Yes'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Do you have experience in hydroponics?',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  CheckboxListTile(
                    value: _hydroponics,
                    onChanged: (bool? value) {
                      _toggleCheckbox(value!, 'hydroponics');
                    },
                    title: Text('Yes'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Please describe your experience in the agriculture industry',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Your answer here',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _experience = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
