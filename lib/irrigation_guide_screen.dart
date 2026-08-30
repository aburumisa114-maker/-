import 'package:flutter/material.dart';

class IrrigationGuideScreen extends StatelessWidget {
  const IrrigationGuideScreen({super.key});

  final List<Map<String, String>> _guidelines = const [
    {
      'crop': 'القطن',
      'water': 'يحتاج إلى ري منتظم مع فترة تعطيش خفيفة بعد الإنبات لتشجيع تعميق الجذور، ثم انتظام الري خلال فترة التزهير وعقد العقد.',
      'fertilizer': 'التسميد النيتروجيني على دفعات (مع العزقة الأولى والثانية) بالإضافة إلى إضافة الفوسفور وبوتاسيوم حسب الحاجة.',
    },
    {
      'crop': 'زهرة الشمس',
      'water': 'حساس جداً للعطش أثناء مراحل تكوين الأقراص والإزهار؛ يتطلب رياً منتظماً مع تجنب تغدق المياه.',
      'fertilizer': 'السماد الأزوتى والسماد الفوسفاتي عند التجهيز والدفعة الأولى قبل الرية الأولى.',
    },
    {
      'crop': 'القمح',
      'water': 'الرية الكداسة (أو الزراعة على الحاتي) ثم ريات منتظمة أهمها رية الإنجاس والتطرد والامتلاء.',
      'fertilizer': 'السماد النيتروجيني مقسماً على دفعات مع الري.',
    },
    {
      'crop': 'الفول السوداني',
      'water': 'الري بحرص لتجنب تعفن البذور، ويجب توفير الرطوبة المعتدلة خلال فترة تكوين القرون.',
      'fertilizer': 'السماد الفوسفاتي والجبس الزراعي لتعزيز امتصاص الكالسيوم وملء القرون.',
    },
    {
      'crop': 'الذرة الرفيعة',
      'water': 'مقاوم نسبياً للجفاف ولكن الري المنتظم خلال مرحلة الطرد والازهار يرفع الإنتاجية بشدة.',
      'fertilizer': 'النيتروجين على دفعات مع العزيق.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مرشد الري والتسميد للمحاصيل'),
        backgroundColor: Colors.green[800],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: _guidelines.length,
        itemBuilder: (context, index) {
          final item = _guidelines[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['crop']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 4),
                  const Text('💧 الاحتياجات المائية:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(item['water']!, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 8),
                  const Text('🌱 التسميد:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(item['fertilizer']!, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
