import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // مكتبة فتح الواتساب

class SubscriptionScreen extends StatefulWidget {
  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  String selectedCurrency = 'SDG'; // العملة الافتراضية الجنيه السوداني
  final TextEditingController _receiptController = TextEditingController();

  // رقم الواتساب الخاص بك مع رمز الدولة السودانية (249)
  final String ownerWhatsAppNumber = '249913846556'; 

  @override
  void dispose() {
    _receiptController.dispose();
    super.dispose();
  }

  // دالة فتح الواتساب برساْلَة جاهزة تتضمن رقم الإيصال
  Future<void> _sendWhatsAppMessage(String receiptNo) async {
    String message = Uri.encodeComponent(
        'السلام عليكم، أرغب في تفعيل باقة الاشتراك الزراعية VIP.\nرقم إيصال التحويل الخاص بي هو: $receiptNo\nرقم الحساب المحول إليه: 4613079');
    
    final Uri whatsappUri = Uri.parse('https://wa.me/$ownerWhatsAppNumber?text=$message');
    
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تعذر فتح تطبيق واتساب، تأكد من تثبيته على هاتفك')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String priceDisplay = selectedCurrency == 'SDG' ? '25,000 ج.س / شهرياً' : '\$15 / شهرياً';

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
            // زر تبديل العملة
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('اختر العملة: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ChoiceChip(
                  label: Text('الجنيه السوداني (SDG)'),
                  selected: selectedCurrency == 'SDG',
                  onSelected: (selected) {
                    setState(() {
                      selectedCurrency = 'SDG';
                    });
                  },
                  selectedColor: Colors.green.shade200,
                ),
                SizedBox(width: 10),
                ChoiceChip(
                  label: Text('الدولار (\$ USD)'),
                  selected: selectedCurrency == 'USD',
                  onSelected: (selected) {
                    setState(() {
                      selectedCurrency = 'USD';
                    });
                  },
                  selectedColor: Colors.green.shade200,
                ),
              ],
            ),
            SizedBox(height: 16),
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
            _buildPricingCard(
              context,
              title: 'الباقة الزراعية المتقدمة (VIP)',
              price: priceDisplay,
              features: [
                'تشخيص غير محدود للآفات والأمراض عبر الصور',
                'توصيات فورية بالمادة الفعالة والتدخل السريع',
                'لوحات تحليل الإنتاجية وتكلفة المدخلات',
                'دعم فني واستشارات هندسية خاصة',
              ],
              buttonText: 'اشترك الآن',
              isPopular: true,
              onPressed: () {
                _showPaymentDialog(context, selectedCurrency);
              },
            ),
          ],
        ),
      ),
    );
  }

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
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.teal[800]),
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

  void _showPaymentDialog(BuildContext context, String currency) {
    String bankDetails = currency == 'SDG'
        ? 'بنك الخرطوم (تطبيق بنكك):\nرقم الحساب: 4613079\nاسم الحساب: بابكر إبراهيم محمد أحمد\n\nقم بالتحويل ثم أدخل رقم الإيصال أدناه.'
        : 'حساب الدولار الدولي:\nرقم الحساب: 4613079 (USD)\nاسم الحساب: بابكر إبراهيم محمد أحمد';

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('تفاصيل الدفع والتحويل (${currency == 'SDG' ? 'بالجنيه السوداني' : 'بالدولار'})'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('الرجاء التحويل إلى الحساب أدناه:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(bankDetails, style: TextStyle(fontSize: 14, height: 1.5)),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _receiptController,
                decoration: InputDecoration(
                  labelText: 'أدخل رقم إيصال التحويل أو مرجع العملية',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text('إلغاء'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (_receiptController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('الرجاء إدخال رقم إيصال التحويل أولاً')),
                );
                return;
              }
              String receipt = _receiptController.text;
              Navigator.pop(dialogContext);
              
              // فتح الواتساب الخاص بك برسالة جاهزة
              _sendWhatsAppMessage(receipt);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            icon: Icon(Icons.chat, color: Colors.white),
            label: Text('إرسال عبر الواتساب', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
