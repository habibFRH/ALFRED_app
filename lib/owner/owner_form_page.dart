import 'package:alfred/owner/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class OwnerFormPage extends StatefulWidget {
  const OwnerFormPage({super.key});

  @override
  _OwnerFormPageState createState() => _OwnerFormPageState();
}

class _OwnerFormPageState extends State<OwnerFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _paymentMethod;
  String? _selectedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        '👋 مرحبًا بك صاحب المؤسسة! \nيرجى ملء الاستمارة التالية:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 16),
                      _buildTextField('اسمك', 'أدخل اسمك', Icons.person),
                      _buildTextField(
                          'اسم المؤسسة', 'أدخل اسم مؤسستك', Icons.business),
                      const SizedBox(height: 20),
                      const Text(
                        '🏢 يرجى تحديد اسم الفرع (إذا كان لديك فروع متعددة):',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10),
                      _buildFilePicker(),
                      const SizedBox(height: 20),
                      const Text(
                        '📧 يرجى تحديد رؤساء الأقسام:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.right,
                      ),
                      _buildTextField('البريد الإلكتروني',
                          'أدخل البريد الإلكتروني', Icons.email),
                      _buildTextField(
                          'رقم الهاتف', 'أدخل رقم الهاتف', Icons.phone,
                          keyboardType: TextInputType.phone),
                      const SizedBox(height: 20),
                      const Text(
                        '💳 اختر طريقة الدفع:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.right,
                      ),
                      _buildPaymentOption(
                          'شهري', '1000 دج لكل موظف', Icons.calendar_month),
                      _buildPaymentOption(
                          'سنوي',
                          '2 مليون دج سنويًا مع تخفيض 15%',
                          Icons.calendar_today),
                      const SizedBox(height: 30),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('🎉 تم تأكيد معلوماتك بنجاح!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              // Navigate to HomePage
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            elevation: 5,
                            backgroundColor: Colors.blueAccent,
                          ),
                          child: const Text('✅ تأكيد معلوماتي',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, IconData icon,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.grey[100],
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        ),
        keyboardType: keyboardType,
        validator: (value) => value!.isEmpty ? 'يرجى إدخال $label' : null,
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget _buildFilePicker() {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['csv', 'xls', 'xlsx'],
        );
        if (result != null) {
          setState(() {
            _selectedFile = result.files.single.name;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
          color: Colors.grey[100],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedFile ?? '📂 تحميل ملف Excel / CSV',
              textDirection: TextDirection.rtl,
              style: const TextStyle(color: Colors.black54),
            ),
            const Icon(Icons.upload_file, color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String value, String description, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: RadioListTile<String>(
        title: Row(
          children: [
            Icon(icon, color: Colors.blueAccent),
            const SizedBox(width: 10),
            Expanded(
                child: Text(description, textDirection: TextDirection.rtl)),
          ],
        ),
        value: value,
        groupValue: _paymentMethod,
        onChanged: (val) => setState(() => _paymentMethod = val),
        activeColor: Colors.blueAccent,
      ),
    );
  }
}
