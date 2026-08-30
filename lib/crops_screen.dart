import 'package:flutter/material.dart';

class Crop {
  final String name;
  final String description;
  final String optimalTemp;
  final String imagePath;

  Crop({
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
      name: 'القمح',
      description: 'من أهم المحاصيل الاستراتيجية الشتوية، يحتاج لدرجات حرارة معتدلة ورِي منتظم.',
      optimalTemp: '15°C - 20°C',
      imagePath: 'assets/images/wheat.png',
    ),
    Crop(
      name: 'الفول السوداني',
      description: 'محصول زراعي صيفي رئيسي، تجود زراعته في الأراضي الرملية الخفيفة.',
      optimalTemp: '25°C - 30°C',
      imagePath: 'assets/images/peanut.png',
    ),
    Crop(
      name: 'الذرة الرفيعة',
      description: 'من المحاصيل المتاقلمة مع الظروف الجافة وحارة الطقس.',
      optimalTemp: '27°C - 32°C',
      imagePath: 'assets/images/sorghum.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المحاصيل الزراعية'),
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
                child: Icon(Icons.agriculture, color: Colors.green[800]),
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
