import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PestDiagnosisScreen extends StatefulWidget {
  @override
  _PestDiagnosisScreenState createState() => _PestDiagnosisScreenState();
}

class _PestDiagnosisScreenState extends State<PestDiagnosisScreen> {
  File? _selectedImage;
  bool _isLoading = false;
  String _diagnosisResult = "";

  // دالة لالتقاط الصورة عبر الكاميرا أو المعرض
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _diagnosisResult = "";
      });
      _analyzeImage();
    }
  }

  // تحليل الأعراض للآفات الخاصة بمحاصيلك (القطن، الفول السوداني، إلخ)
  void _analyzeImage() async {
    setState(() {
      _isLoading = true;
    });

    // محاكاة وقت المعالجة والتحليل الذكي
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _isLoading = false;
      _diagnosisResult = 
          "اسم الآفة: المن أو دودة ورق القطن\n"
          "المحصول المتأثر: الفول السوداني / القطن / الذرة الرفيعة\n"
          "الأعراض: تآكل الأوراق، وجود اصفرار، أو إفرازات غير طبيعية.\n"
          "المادة الفعالة الموصى بها: مبيد حشري جهازي متخصص\n"
          "التدخل السريع: التدخل بالرش في الصباح الباكر وإزالة الأوراق شديدة الإصابة.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('التشخيص الذكي للآفات والأمراض'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade300),
              ),
              child: _selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(_selectedImage!, fit: BoxFit.cover),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt, size: 50, color: Colors.green),
                        SizedBox(height: 8),
                        Text('التقط صورة لورقة المحصول المصاب',
                            style: TextStyle(color: Colors.grey[700])),
                      ],
                    ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.camera),
                  icon: Icon(Icons.camera),
                  label: Text('الكاميرا'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: Icon(Icons.photo_library),
                  label: Text('المعرض'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (_isLoading)
              Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(color: Colors.green),
                    SizedBox(height: 10),
                    Text('جاري تحليل الأعراض واكتشاف الآفة...'),
                  ],
                ),
              ),
            if (_diagnosisResult.isNotEmpty && !_isLoading)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.assignment_turned_in, color: Colors.green),
                          SizedBox(width: 8),
                          Text('نتائج التقرير والتدخل السريع:',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[800])),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 8),
                      Text(_diagnosisResult,
                          style: TextStyle(fontSize: 16, height: 1.5)),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
