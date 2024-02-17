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
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('gloria.kim@gmail.com'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('+1 415-123-4567'),
                ),
                ListTile(
                  leading: Icon(Icons.circle),
                  title: Text('Active'),
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text('01/12/2022'),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: implement block account logic
            },
            child: Text('Block Account'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
