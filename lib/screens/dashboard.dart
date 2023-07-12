import 'package:crb/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  final String email;

  DashboardPage({required this.email});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Map<String, dynamic>> _data = [
    {'id': 1, 'name': 'cocua', 'description': 'Lorem ipsum is placeholder '},
    {
      'id': 2,
      'name': 'lapo',
      'description':
          'text commonly used in the graphic, print, and publishing industries for '
    },
    {
      'id': 3,
      'name': 'revan',
      'description': 'previewing layouts and visual mockups'
    },
    {
      'id': 4,
      'name': 'zozo',
      'description': ' print, and publishing industries for'
    },
    {
      'id': 5,
      'name': 'pretty',
      'description':
          'text commonly used in the graphic, print, and publishing industries for'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isLoggedIn', false);
              await prefs.remove('email');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.grey,
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_data[index]['name']),
              subtitle: Text(_data[index]['description']),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(_data[index]['name']),
                      content: Text(_data[index]['description']),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
