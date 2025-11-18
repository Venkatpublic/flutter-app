import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome, User 👋',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const Text(
              'This is your first Flutter screen. Below are some buttons:',
            ),

            ElevatedButton(
              onPressed: () {
                print('Button 1 pressed');
              },
              child: const Text('Button 1'),
            ),
            const SizedBox(width: 8),
            OutlinedButton(
              onPressed: () {
                print('Button 2 pressed');
              },
              child: const Text('Button 2'),
            ),
          ],
        ),
      ),
    );
  }
}
