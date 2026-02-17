import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is AuthAuthenticated) {
              return Center(child: Text('Welcome ${state.user.name}'));
            }
            if (state is AuthError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(const LoginRequested('test@test.com', 'password'));
                },
                child: const Text('Login'),
              ),
            );
          },
        ),
      ),
    );
  }
}
