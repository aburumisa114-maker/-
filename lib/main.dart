import 'package:flutter/material.dart';

void main() {
  runApp(const BabikerApp());
}

class BabikerApp extends StatelessWidget {
  const BabikerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'بابكر الباكر',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B5E20),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.agriculture,
                size: 80,
                color: Color(0xFF1B5E20),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'تطبيق بابكر الباكر',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'مرشدك الزراعي وسوقك المباشر',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFFFF59D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
