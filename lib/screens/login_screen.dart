import 'package:crb/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                TextButton(
                  child: Text('Login'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Simulate authentication process
                      // ...
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Welcome to the dashboard!'),
                            content: Text(
                                'You have successfully logged in as ${_emailController.text}.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    // Simulate authentication process
                                    // ...
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setBool('isLoggedIn', true);
                                    await prefs.setString(
                                        'email', _emailController.text);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DashboardPage(
                                            email: _emailController.text),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
