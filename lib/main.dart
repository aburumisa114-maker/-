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
      home: const MainGateScreen(),
    );
  }
}

// بوابة التحقق: تفحص هل المستخدم مشترك أم لا
class MainGateScreen extends StatelessWidget {
  const MainGateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // قم بتغيير هذه القيمة إلى true إذا كان المستخدم قد دفع اشتراكه الشهري، أو false لإظهار شاشة الدفع
    final bool isSubscribed = false; 

    if (isSubscribed) {
      return const DashboardScreen(); // تظهر الخدمات الكاملة للمشترك
    } else {
      return const SubscriptionScreen(); // تظهر شاشة الدفع وأرقام الحسابات لغير المشترك
    }
  }
}

// 1. شاشة الخدمات الرئيسية الكاملة (تظهر للمشتركين فقط)
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('النظام الزراعي الذكي - حلفا الجديدة'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'الخدمات والتحليلات الزراعية المتقدمة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 15),
            _buildServiceButton(context, 'مراقبة الأقمار الصناعية والحقول', Icons.satellite, Colors.teal),
            _buildServiceButton(context, 'حاسبة المساحات والتقاوي', Icons.calculate, Colors.green[700]!),
            _buildServiceButton(context, 'إدارة الري والمياه', Icons.water_drop, Colors.blue),
            _buildServiceButton(context, 'تشخيص الآفات والأمراض النباتية', Icons.bug_report, Colors.brown),
            _buildServiceButton(context, 'بورصة أسعار المحاصيل اليومية', Icons.trending_up, Colors.orange[800]!),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceButton(BuildContext context, String title, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          alignment: Alignment.centerRight,
        ),
        onPressed: () {
          // إجراء الانتقال للخدمة المطلوبة
        },
        icon: Icon(icon, color: Colors.white),
        label: Text(title, style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

// 2. شاشة الاشتراك والدفع (تظهر لغير المشتركين)
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
              'بيانات الاشتراك الشهري والدفع',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text(
              'للحصول على النسخة الكاملة وتفعيل الحساب:\n• بنك الخرطوم: رقم الحساب [أدخل الرقم هنا]\n• تطبيق بركة / تطبيق صرافة: [أدخل التفاصيل هنا]',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                // ربط زر الواتساب لإرسال الإيصال
              },
              icon: const Icon(Icons.chat),
              label: const Text('التواصل عبر الواتساب للدعم وتأكيد التفعيل'),
            ),
          ],
        ),
      ),
    );
  }
}
