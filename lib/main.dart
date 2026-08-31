import 'package:flutter/material.dart';
import 'satellite_screen.dart'; // استيراد شاشة مراقبة الأقمار الصناعية

void main() {
  runApp(AgriculturalApp());
}

class AgriculturalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تطبيق إدارة الحقول الزراعية',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: MainMenuScreen(),
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('النظام الزراعي الذكي'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'الخدمات والتحليلات الزراعية',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[900]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            
            // زر الانتقال إلى شاشة الأقمار الصناعية
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SatelliteMonitoringScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[700],
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              icon: Icon(Icons.satellite_alt, color: Colors.white, size: 28),
              label: Text(
                'مراقبة الأقمار الصناعية والحقول',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            
            // يمكنك إضافة أزرار الأقسام الأخرى هنا تباعاً
          ],
        ),
      ),
    );
  }
}
