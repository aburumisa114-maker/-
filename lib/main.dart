import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'subscription_screen.dart';
import 'crops_screen.dart'; // تأكد من استبدالها باسم شاشة الخدمات الرئيسية إذا كانت مختلفة لديك

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
      // نقطة البداية تبدأ بشاشة تسجيل الدخول
      home: const LoginScreenWrapper(),
    );
  }
}

// نموذج لفحص حالة المستخدم والاشتراك عند الدخول
class LoginScreenWrapper extends StatefulWidget {
  const LoginScreenWrapper({Key? key}) : super(key: key);

  @override
  State<LoginScreenWrapper> createState() => _LoginScreenWrapperState();
}

class _LoginScreenWrapperState extends State<LoginScreenWrapper> {
  // متغيرات تجريبية للحالة (يمكن ربطها بقاعدة البيانات لاحقاً مثل Firebase)
  final bool isLoggedIn = true;     // هل المستخدم مسجل دخول؟
  final bool isSubscribed = false;  // هل قام بالدفع وتم تفعيل حسابه؟ (اجعلها true إذا كان مشتركاً)

  @override
  Widget build(BuildContext context) {
    // 1. إذا لم يكن مسجل دخول، تظهر له شاشة تسجيل الدخول الأصلية
    if (!isLoggedIn) {
      return const LoginScreen(); 
    } 
    
    // 2. إذا مسجل دخول ولكن لم يدفع / لم يفعل اشتراكه، يُوجه لشاشة الدفع وأرقام الحسابات
    if (!isSubscribed) {
      return const SubscriptionScreen();
    } 
    
    // 3. إذا سجل الدفع وتم تفعيل حسابه، يدخل مباشرة للخدمات الكاملة للتطبيق
    return const CropsScreen();
  }
}
