import 'package:flutter/material.dart';
import 'package:flutter_e_com/service/firebase_service.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Profile View',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 30,
        ),
        FutureBuilder(
            future: FireAuthService().checkUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ExpansionTile(
                      title: Text(
                        "User Information",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      children: [
                        ListTile(
                          title: const Text('Name'),
                          subtitle: Text(' ${snapshot.data.displayName}'),
                        ),
                        ListTile(
                          title: const Text('Email'),
                          subtitle: Text(' ${snapshot.data.email}'),
                        ),
                        ListTile(
                          title: const Text('Logout'),
                          onTap: () async {
                            await FireAuthService().logout();
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/', (route) => false);
                          },
                        ),
                      ]);
                } else {
                  return ElevatedButton.icon(
                      onPressed: () {
                        FireAuthService().signInWithGoogle();
                      },
                      label: const Text('Login With Google'),
                      icon: const Icon(Icons.login));
                }
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ],
    );
  }
}
