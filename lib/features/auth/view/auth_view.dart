import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            const Text('Login'),
             TextFormField(
              decoration: InputDecoration(
                
                label: const Text('Email'),
                hintText: 'Email',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                label: const Text('Password'),
                hintText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}