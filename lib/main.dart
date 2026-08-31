import 'package:flutter/material.dart';
import 'satellite_screen.dart';
import 'package:url_launcher/url_launcher.dart';

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
  // دالة لفتح الواتساب أو الروابط الخارجية
  Future<void> _launchWhatsApp() async {
    final Uri whatsappUrl = Uri.parse('https://wa.me/+249000000000?text=السلام%20عليكم،%20أريد%20الاستفسار%20عن%20اشتراك%20النظام%20الزراعي');
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    }
  }

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
            
            // 1. مراقبة الأقمار الصناعية
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

            // 2. حاسبة المساحات والتقاوي
            ElevatedButton.icon(
              onPressed: () {
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

            // 3. إدارة الري والمياه
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

            // 4. تشخيص الآفات والأمراض
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
            SizedBox(height: 24),

            Divider(thickness: 2, color: Colors.green[200]),
            SizedBox(height: 12),

            // 5. زر الاشتراك، الدفع، وأرقام الحسابات
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('بيانات الاشتراك والدفع'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('💳 للحصول على النسخة الكاملة وتفعيل الحساب:'),
                        SizedBox(height: 8),
                        Text('• بنك الخرطوم (بنكك): رقم الحساب [أدخل الرقم هنا]'),
                        Text('• تطبيق بركة / تطبيق صرافة: [أدخل التفاصيل هنا]'),
                        SizedBox(height: 12),
                        Text('📞 يرجى إرسال إيصال التحويل عبر الواتساب لتأكيد التفعيل.'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('إغلاق'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[800],
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              icon: Icon(Icons.payment, color: Colors.white, size: 26),
              label: Text(
                'الاشتراك، الدفع وأرقام الحسابات',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 12),

            // 6. زر التواصل عبر الواتساب
            ElevatedButton.icon(
              onPressed: _launchWhatsApp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              icon: Icon(Icons.chat, color: Colors.white, size: 26),
              label: Text(
                'التواصل عبر الواتساب للدعم',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
