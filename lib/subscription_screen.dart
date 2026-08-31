import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('باقات الاشتراك الزراعية'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // العنوان الترويجي
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Column(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 40),
                  SizedBox(height: 8),
                  Text(
                    'طور إدارتك الزراعية وضاعف إنتاجك',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'احصل على تشخيص غير محدود للآفات، تقارير الإنتاجية، ودعم الخبراء.',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // الباقة الأولى: الباقة المجانية
            _buildPricingCard(
              context,
              title: 'الباقة الأساسية (المجانية)',
              price: 'مجاناً',
              features: [
                'استعراض دليل الري الأساسي',
                'حاسبة المساحات البسيطة',
                'عدد محدود من عمليات التشخيص (3 شهرياً)',
              ],
              buttonText: 'الباقة الحالية',
              isPopular: false,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('أنت تستخدم الباقة المجانية حالياً')),
                );
              },
            ),
            SizedBox(height: 16),

            // الباقة الثانية: الباقة المميزة VIP
            _buildPricingCard(
              context,
              title: 'الباقة الزراعية المتقدمة (VIP)',
              price: '\$15 / شهرياً',
              features: [
                'تشخيص غير محدود للآفات والأمراض عبر الصور',
                'توصيات فورية بالمادة الفعالة والتدخل السريع',
                'لوحات تحليل الإنتاجية وتكلفة المدخلات',
                'دعم فني واستشارات هندسية خاصة',
              ],
              buttonText: 'اشترك الآن',
              isPopular: true,
              onPressed: () {
                _showPaymentDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // دالة لتصميم بطاقة الباقة
  Widget _buildPricingCard(
    BuildContext context, {
    required String title,
    required String price,
    required List<String> features,
    required String buttonText,
    required bool isPopular,
    required VoidCallback onPressed,
  }) {
    return Card(
      elevation: isPopular ? 6 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isPopular ? Colors.green : Colors.grey.shade300,
          width: isPopular ? 2 : 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isPopular)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'الأكثر طلباً للمشاريع',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            if (isPopular) SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[900]),
            ),
            SizedBox(height: 8),
            Text(
              price,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.teal[800]),
            ),
            Divider(height: 24),
            ...features.map((feature) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 18),
                      SizedBox(width: 8),
                      Expanded(child: Text(feature, style: TextStyle(fontSize: 14))),
                    ],
                  ),
                )),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPopular ? Colors.green[700] : Colors.grey[700],
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(buttonText, style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // نافذة إتمام الدفع أو تفعيل الاشتراك التجريبي
  void _showPaymentDialog(BuildContext context) {
    showDialog(
      context: DialogContextHelper.context ?? context,
      builder: (context) => AlertDialog(
        title: Text('تفعيل الاشتراك المتقدم'),
        content: Text('اختر وسيلة الدفع المناسبة لتفعيل باقة المشتركين المميزين فوراً وفتح كافة الميزات الذكية.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('إلغاء'),
          ),
          ElevatedButton(
            onHeadingClick: () {},
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('تم تفعيل الباقة بنجاح! شكراً لاشتراكك.')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Text('تأكيد الدفع'),
          ),
        ],
      ),
    );
  }
}

class DialogContextHelper {
  static BuildContext? context;
}
