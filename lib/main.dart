import 'package:flutter/material.dart';

void main() {
  runApp(const SmartAgriApp());
}

class SmartAgriApp extends StatelessWidget {
  const SmartAgriApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'النظام الزراعي الذكي - حلفا الجديدة',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF9F6F0),
      ),
      home: const SubscriptionScreen(),
    );
  }
}

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('النظام الزراعي الذكي - حلفا الجديدة'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.payment, size: 80, color: Colors.orange),
            const SizedBox(height: 20),
            const Text(
              'بيانات الاشتراك والدفع',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'للحصول على النسخة الكاملة وتفعيل الحساب:\n• بنك الخرطوم: رقم الحساب [أدخل الرقم هنا]\n• تطبيق بركة / تطبيق صرافة: [أدخل التفاصيل هنا]',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {},
              icon: const Icon(Icons.chat),
              label: const Text('التواصل عبر الواتساب للدعم'),
            ),
          ],
        ),
      ),
    );
  }
}
