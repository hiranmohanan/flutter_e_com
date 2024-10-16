import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/auth_bloc.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(AuthCall());
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            debugPrint('Auth State $state');
            if (state is AuthSuccess) {
             
              Navigator.of(context).pushReplacementNamed('/home');
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login Failure ${state.error}')));
            }
            else if (state is AuthLogout) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout Successful')));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const CircularProgressIndicator();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthGoogleCall());
                    },
                    label: const Text('Continue With Google'),
                    icon: const Icon(FontAwesomeIcons.googlePlusG)),
                ElevatedButton.icon(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthGoogleCall());
                    },
                    label: const Text('Register With Google'),
                    icon: const Icon(FontAwesomeIcons.googlePlusG)),
              ],
            );
          },
        ),
      ),
    );
  }
}
