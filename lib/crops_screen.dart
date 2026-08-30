import 'package:flutter/material.dart';

class Crop {
  final String name;
  final String description;
  final String optimalTemp;
  final String imagePath;

  const Crop({
    required this.name,
    required this.description,
    required this.optimalTemp,
    required this.imagePath,
  });
}

class CropsScreen extends StatelessWidget {
  const CropsScreen({super.key});

  final List<Crop> cropsList = const [
    Crop(
      name: 'الذرة الرفيعة',
      description: 'من المحاصيل الاستراتيجية المتأقلمة مع الظروف الجافة ومناطق الهامش الزراعي.',
      optimalTemp: '27°C - 32°C',
      imagePath: 'assets/images/sorghum.png',
    ),
    Crop(
      name: 'القطن',
      description: 'الذهب الأبيض، محصول نقدى صيفي رئيسي يحتاج لتربة طينية خصبة وعناية خاصة.',
      optimalTemp: '25°C - 35°C',
      imagePath: 'assets/images/cotton.png',
    ),
    Crop(
      name: 'العدسية',
      description: 'من محاصيل البقوليات المهمة لتحسين خواص التربة وتوفير البروتين النباتي.',
      optimalTemp: '18°C - 24°C',
      imagePath: 'assets/images/pigeon_pea.png',
    ),
    Crop(
      name: 'الفول السوداني',
      description: 'محصول صيفي رئيسي تجود زراعته في الأراضي الرملية الخفيفة وذات التصريف الجيد.',
      optimalTemp: '25°C - 30°C',
      imagePath: 'assets/images/peanut.png',
    ),
    Crop(
      name: 'زهرة الشمس',
      description: 'محصول زيتى هام يتميز بتحمله النسبي لظروف الإجهاد الجفافي وقصر دوره زراعته.',
      optimalTemp: '21°C - 26°C',
      imagePath: 'assets/images/sunflower.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة المحاصيل الحقلية'),
        backgroundColor: Colors.green[800],
      ),
      body: ListView.builder(
        itemCount: cropsList.length,
        itemBuilder: (context, index) {
          final crop = cropsList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green[100],
                child: Icon(Icons.eco, color: Colors.green[800]),
              ),
              title: Text(crop.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(crop.description, maxLines: 2, overflow: TextOverflow.ellipsis),
              trailing: Text(crop.optimalTemp, style: TextStyle(color: Colors.grey[700], fontSize: 12)),
            ),
          );
        },
      ),
    );
  }
}
