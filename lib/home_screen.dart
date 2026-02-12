import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_login_ui/bloc/auth_bloc.dart';
import 'package:flutter_responsive_login_ui/login_screen.dart';
import 'package:flutter_responsive_login_ui/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UID'),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthInitial) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (predicate) => false);
            }
          },
          builder: (context, state) {
            if(state is AuthLoading) {
              return const Center(child: CircularProgressIndicator(color: Colors.red));
            }
            return Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text((state as AuthSuccess).uid),
                const SizedBox(height: 24),
                GradientButton(onPressed: () {
                  context.read<AuthBloc>().add(AuthLogOutRequested());
                }),
              ],
            ));
          },
        ));
  }
}
