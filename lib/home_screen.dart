import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_login_ui/bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('UID'),
      ),
      body: authState is AuthSuccess
          ? Center(child: Text(authState.uid))
          : const Center(child: Text("")),
    );
  }
}
