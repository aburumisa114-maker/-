import 'package:flutter/material.dart';

class PestsScreen extends StatelessWidget {
  const PestsScreen({super.key});

  final List<Map<String, String>> _pestsList = const [
    {
      'crop': 'القطن',
      'pest': 'دودة ورق القطن ودودة اللوز',
      'symptoms': 'تغذية اليرقات على الأوراق وحدث ثقوب وتهتك، وتلف الأقوز أو الجوز لاحقاً.',
      'control': 'المكافحة المتكاملة، استخدام المبيدات الموصى بها حسب توصيات وزارة الزراعة، والرش عند الوصول لحد الحرج الاقتصادي.',
    },
    {
      'crop': 'الفول السوداني',
      'pest': 'صانعات الحفر (دودة أوراق الفول السوداني) والمن',
      'symptoms': 'وجود خطوط بيضاء أو أنفاق في الأوراق، واصفرار النبات وضعف النمو نتيجة امتصاص العصارة.',
      'control': 'استخدام المبيدات الحشرية الجهازية لمكافحة المن، والمبيدات الملائمة لصانعات الأنفاق.',
    },
    {
      'crop': 'القمح',
      'pest': 'المن والصدأ (فطريات)',
      'symptoms': 'بقع صفراء أو برتقالية أو سوداء على الأوراق والسيقان، وتجمع حشرات المن على السنابل والقمم النمو.',
      'control': 'استخدام مبيدات فطرية مكافحة للأصداء عند ظهور الإصابة الأولى، ومبيدات حشرية للمن.',
    },
    {
      'crop': 'الذرة الرفيعة',
      'pest': 'دودة الساق الحفار والمن',
      'symptoms': 'ثقوب في السيقان والأوراق، وجود نشارة على الساق، وذبول النباتات المصابة.',
      'control': 'الاهتمام بالنظافة الحقلية، استخدام حبيبات المبيدات الموصى بها في القلب، أو الرش عند الإصابة.',
    },
    {
      'crop': 'زهرة الشمس',
      'pest': 'دودة قياس الأوراق والمن',
      'symptoms': 'تأكل حواف الأوراق والنموات الحديثة، ووجود إفرازات عسلية.',
      'control': 'استخدام المبيدات الحشرية المناسبة ومتابعة الرش المبكر.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تشخيص الآفات والمبيدات'),
        backgroundColor: Colors.green[800],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: _pestsList.length,
        itemBuilder: (context, index) {
          final item = _pestsList[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['crop']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red.shade200),
                        ),
                        child: Text(
                          item['pest']!,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.red[800]),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 4),
                  const Text('🔍 أعراض الإصابة:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(item['symptoms']!, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 8),
                  const Text('🛡️ طرق المكافحة والمبيدات:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(item['control']!, style: const TextStyle(fontSize: 14, color: Colors.black87)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
