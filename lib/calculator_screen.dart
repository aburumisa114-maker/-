import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _controller = TextEditingController();
  String _selectedCrop = 'القمح';
  double _result = 0.0;

  // معدل تقاوي تقريبي لكل فدان (بالكيلوجرام)
  final Map<String, double> _seedRates = {
    'القمح': 50.0,
    'الفول السوداني': 30.0,
    'الذرة الرفيعة': 10.0,
    'القطن': 15.0,
    'زهرة الشمس': 5.0,
  };

  void _calculate() {
    final double area = double.tryParse(_controller.text) ?? 0.0;
    final double rate = _seedRates[_selectedCrop] ?? 0.0;
    setState(() {
      _result = area * rate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حاسبة التقاوي الزراعية'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'احسب كمية البذور المطلوبة لمساحتك:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCrop,
              items: _seedRates.keys.map((crop) {
                return DropdownMenuItem(value: crop, child: Text(crop));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCrop = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: 'اختر المحصول',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'المساحة (بالفدان)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('احسب كمية التقاوي', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 30),
            if (_result > 0)
              Card(
                color: Colors.green[50],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'كمية التقاوي المطلوبة لـ ${_controller.text} فدان من _selectedCrop: \n$_result كيلوجرام',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[900]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
