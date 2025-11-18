import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_basic/src/presentation/providers/auth_providers.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  void _logout(BuildContext context, WidgetRef ref) {
    ref.read(authNotifierProvider.notifier).logout();
    context.go('/');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            authState.when(
              data: (user) => Text(
                'Welcome, ${user?.name ?? user?.email ?? 'Guest'}!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Error: $error'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _logout(context, ref),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
