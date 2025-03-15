import 'package:flutter/material.dart';

class ComplaintsPage extends StatelessWidget {
  const ComplaintsPage({super.key});

  final List<Map<String, String>> complaints = const [
    {
      'number': '1',
      'employee': 'أحمد خالد',
      'subject': 'تأخير في الرد على الطلبات',
      'details': 'هناك تأخير مستمر في معالجة الطلبات المقدمة للإدارة.',
    },
    {
      'number': '2',
      'employee': 'سارة محمود',
      'subject': 'مشاكل في بيئة العمل',
      'details': 'بيئة العمل تحتاج إلى تحسين من حيث التهوية والإضاءة.',
    },
    {
      'number': '3',
      'employee': 'محمد علي',
      'subject': 'عدم توفر أدوات العمل',
      'details': 'هناك نقص في الأدوات الضرورية لإنجاز المهام اليومية.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('⚠️ مساحة الشكاوي', textDirection: TextDirection.rtl)),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: complaints.length,
          itemBuilder: (context, index) {
            final complaint = complaints[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 15),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'شكوى رقم: ${complaint['number']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'من الموظف: ${complaint['employee']}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'الموضوع: ${complaint['subject']}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'التفاصيل: ${complaint['details']}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
