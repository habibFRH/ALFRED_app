import 'package:alfred/owner/StressAssessmentPage.dart';
import 'package:flutter/material.dart';
import 'package:alfred/owner/TrainingSelectionPage.dart'; // ✅ Import Training Page
import 'package:alfred/owner/LoanRequestPage.dart'; // ✅ Import Loan Request Page

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

          const ListTile(
            leading: Icon(Icons.subscriptions, color: Colors.green),
            title: Text('📜 اشتراكي', textDirection: TextDirection.rtl),
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

          // Navigate to TrainingSelectionPage
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

          // Navigate to LoanRequestPage
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
        ],
      ),
    );
  }
}
