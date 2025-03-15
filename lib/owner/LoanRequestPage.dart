import 'package:flutter/material.dart';

class LoanRequestPage extends StatefulWidget {
  const LoanRequestPage({super.key});

  @override
  _LoanRequestPageState createState() => _LoanRequestPageState();
}

class _LoanRequestPageState extends State<LoanRequestPage> {
  final TextEditingController _bankController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  void _submitRequest() {
    if (_bankController.text.isEmpty ||
        _amountController.text.isEmpty ||
        _reasonController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('⚠️ يرجى ملء جميع الحقول')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('✅ تم إرسال الطلب بنجاح! سنتواصل معك قريبًا')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🏦 طلب قرض بنكي', textDirection: TextDirection.rtl),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Bank Selection
            const Text(
              '🏛 اختر المؤسسة البنكية',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
            TextField(
              controller: _bankController,
              textDirection: TextDirection.rtl,
              decoration: const InputDecoration(
                hintText: 'مثال: البنك الوطني الجزائري',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Loan Amount
            const Text(
              '💰 المبلغ المراد',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              textDirection: TextDirection.rtl,
              decoration: const InputDecoration(
                hintText: 'أدخل المبلغ المطلوب',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Reason for Loan
            const Text(
              '📜 سبب الطلب',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
            TextField(
              controller: _reasonController,
              textDirection: TextDirection.rtl,
              decoration: const InputDecoration(
                hintText: 'لماذا تحتاج القرض؟',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Confirmation Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  '✅ تأكيد',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Info Text
            const Text(
              '📩 سنتواصل معك في أقرب وقت لاستكمال الإجراءات',
              style: TextStyle(fontSize: 16, color: Colors.red),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }
}
