import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Text(
              'Login',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton.icon(
                onPressed: () {},
                label: const Text('Continue With Google'),
                icon: const Icon(FontAwesomeIcons.googlePlusG)),
          ],
        ),
      ),
    );
  }
}
