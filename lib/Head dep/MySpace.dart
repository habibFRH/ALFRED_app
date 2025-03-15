import 'package:flutter/material.dart';
import 'package:alfred/owner/StressAssessmentPage.dart';
import 'package:alfred/owner/TrainingSelectionPage.dart';
import 'package:alfred/owner/LoanRequestPage.dart';

class MySpacePage extends StatelessWidget {
  const MySpacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🙍‍♂️ مساحتي', textDirection: TextDirection.rtl),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.edit, color: Colors.blue),
            title: Text('📝 التعديل في معلوماتي الشخصية',
                textDirection: TextDirection.rtl),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const StressAssessmentPage()),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.health_and_safety, color: Colors.red),
              title: Text('🧘‍♂️ تقييم الاجهاد النفسي / طلب استشارة نفسية',
                  textDirection: TextDirection.rtl),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TrainingSelectionPage()),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.school, color: Colors.orange),
              title: Text('🎓 التكوين الإلكتروني',
                  textDirection: TextDirection.rtl),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoanRequestPage()),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.account_balance, color: Colors.purple),
              title: Text('🏦 طلب قرض بنكي', textDirection: TextDirection.rtl),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('خاص بمسؤول قسم الموارد البشرية',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const JobApplicationsPage()),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.work, color: Colors.teal),
              title: Text('📄 طلبات التقديم على عمل',
                  textDirection: TextDirection.rtl),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ComplaintsSuggestionsPage()),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.feedback, color: Colors.redAccent),
              title: Text('📩 اقتراحات وشكاوي المواطنين',
                  textDirection: TextDirection.rtl),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}

class JobApplicationsPage extends StatelessWidget {
  const JobApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('طلبات التقديم على عمل')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 5, // Example count
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              title: Text('طلب رقم ${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('نوع الوظيفة: X'),
                  Text('السيرة الذاتية: .pdf',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('تمت معالجته',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ComplaintsSuggestionsPage extends StatelessWidget {
  const ComplaintsSuggestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اقتراحات وشكاوي المواطنين')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 5, // Example count
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              title: Text('اقتراح او شكوى رقم ${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('المحتوى: X',
                  style: TextStyle(color: Colors.grey)),
              trailing: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'تمت معالجته',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
