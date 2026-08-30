import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'حاسبة المساحات الزراعية',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const AreaCalculatorScreen(),
    );
  }
}

class AreaCalculatorScreen extends StatefulWidget {
  const AreaCalculatorScreen({super.key});

  @override
  State<AreaCalculatorScreen> createState() => _AreaCalculatorScreenState();
}

enum ShapeType { rectangle, square, circle, triangle }

class _AreaCalculatorScreenState extends State<AreaCalculatorScreen> {
  ShapeType _selectedShape = ShapeType.rectangle;
  
  final TextEditingController _param1Controller = TextEditingController();
  final TextEditingController _param2Controller = TextEditingController();
  
  double? _result;
  String _errorMessage = '';

  @override
  void dispose() {
    _param1Controller.dispose();
    _param2Controller.dispose();
    super.dispose();
  }

  void _calculateArea() {
    setState(() {
      _errorMessage = '';
      _result = null;
    });

    final val1 = double.tryParse(_param1Controller.text);
    final val2 = double.tryParse(_param2Controller.text);

    if (val1 == null || val1 <= 0) {
      setState(() {
        _errorMessage = 'الرجاء إدخال رقم موجب صحيح للحقل الأول.';
      });
      return;
    }

    switch (_selectedShape) {
      case ShapeType.rectangle:
        if (val2 == null || val2 <= 0) {
          setState(() {
            _errorMessage = 'الرجاء إدخال رقم موجب صحيح للعرض.';
          });
          return;
        }
        setState(() {
          _result = val1 * val2;
        });
        break;

      case ShapeType.square:
        setState(() {
          _result = val1 * val1;
        });
        break;

      case ShapeType.circle:
        setState(() {
          _result = math.pi * math.pow(val1, 2);
        });
        break;

      case ShapeType.triangle:
        if (val2 == null || val2 <= 0) {
          setState(() {
            _errorMessage = 'الرجاء إدخال رقم موجب صحيح للارتفاع.';
          });
          return;
        }
        setState(() {
          _result = 0.5 * val1 * val2;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حاسبة المساحات'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'اختر الشكل الهندسي',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SegmentedButton<ShapeType>(
                segments: const [
                  ButtonSegment(
                    value: ShapeType.rectangle,
                    label: Text('مستطيل'),
                    icon: Icon(Icons.crop_square),
                  ),
                  ButtonSegment(
                    value: ShapeType.square,
                    label: Text('مربع'),
                    icon: Icon(Icons.square_outlined),
                  ),
                  ButtonSegment(
                    value: ShapeType.circle,
                    label: Text('دائرة'),
                    icon: Icon(Icons.circle_outlined),
                  ),
                  ButtonSegment(
                    value: ShapeType.triangle,
                    label: Text('مثلث'),
                    icon: Icon(Icons.change_history),
                  ),
                ],
                selected: {_selectedShape},
                onSelectionChanged: (Set<ShapeType> newSelection) {
                  setState(() {
                    _selectedShape = newSelection.first;
                    _param1Controller.clear();
                    _param2Controller.clear();
                    _result = null;
                    _errorMessage = '';
                  });
                },
              ),
            ),
            const SizedBox(height: 24),
            ..._buildInputFields(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateArea,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('احسب المساحة', style: TextStyle(fontSize: 16)),
            ),
            if (_errorMessage.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
            if (_result != null) ...[
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'المساحة: ${_result!.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  List<Widget> _buildInputFields() {
    switch (_selectedShape) {
      case ShapeType.rectangle:
        return [
          TextField(
            controller: _param1Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'الطول',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _param2Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'العرض',
              border: OutlineInputBorder(),
            ),
          ),
        ];
      case ShapeType.square:
        return [
          TextField(
            controller: _param1Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'طول الضلع',
              border: OutlineInputBorder(),
            ),
          ),
        ];
      case ShapeType.circle:
        return [
          TextField(
            controller: _param1Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'نصف القطر',
              border: OutlineInputBorder(),
            ),
          ),
        ];
      case ShapeType.triangle:
        return [
          TextField(
            controller: _param1Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'القاعدة',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _param2Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'الارتفاع',
              border: OutlineInputBorder(),
            ),
          ),
        ];
    }
  }
}
