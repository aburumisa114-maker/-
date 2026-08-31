import 'package:flutter/material.dart';
import 'satellite_screen.dart';

void main() {
  runApp(AgriculturalApp());
}

class AgriculturalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'النظام الزراعي الذكي',
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
        title: Text('النظام الزراعي الذكي - حلفا الجديدة'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'الخدمات والتحليلات الزراعية المتقدمة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[900]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            
            // 1. زر مراقبة الأقمار الصناعية
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SatelliteMonitoringScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[700],
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              icon: Icon(Icons.satellite_alt, color: Colors.white, size: 26),
              label: Text(
                'مراقبة الأقمار الصناعية والحقول',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 12),

            // 2. زر حاسبة المساحات الزراعية
            ElevatedButton.icon(
              onPressed: () {
                // سيتم توجيهه لحاسبة المساحات إذا كانت موجودة لديك، أو إشعار
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('قسم حاسبة المساحات قيد التفعيل')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600],
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              icon: Icon(Icons.calculate, color: Colors.white, size: 26),
              label: Text(
                'حاسبة المساحات والتقاوي',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 12),

            // 3. زر توصيات الري
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('قسم توصيات الري والسماد قيد التفعيل')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              icon: Icon(Icons.water_drop, color: Colors.white, size: 26),
              label: Text(
                'إدارة الري والمياه',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 12),

            // 4. زر تشخيص الآفات الزراعية
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('قسم تشخيص الآفات قيد التفعيل')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[600],
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              icon: Icon(Icons.bug_report, color: Colors.white, size: 26),
              label: Text(
                'تشخيص الآفات والأمراض النباتية',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
