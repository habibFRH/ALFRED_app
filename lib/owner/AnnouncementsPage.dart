import 'package:flutter/material.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({super.key});

  @override
  _AnnouncementsPageState createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  bool isMarketingChecked = false;
  bool isFinanceChecked = false;
  final TextEditingController _announcementController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child:  Text(
          'مساحة الإعلانات',
          textDirection: TextDirection.rtl,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Input Field
            TextField(
              controller: _announcementController,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: '📝 اكتب إعلانك...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blueAccent),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              ),
            ),
            const SizedBox(height: 20),

            // Announcements Section
            buildAnnouncementSection(
              title: '📌 الإعلانات المثبتة',
              child: CheckboxListTile(
                value: isMarketingChecked,
                onChanged: (value) {
                  setState(() {
                    isMarketingChecked = value!;
                  });
                },
                title: const Text(
                  '📢 رئيس قسم التسويق',
                  textDirection: TextDirection.rtl,
                ),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),

            const SizedBox(height: 10),

            // Employee Suggestions
            buildAnnouncementSection(
              title: '💡 أفكار واقتراحات الموظفين',
              child: CheckboxListTile(
                value: isFinanceChecked,
                onChanged: (value) {
                  setState(() {
                    isFinanceChecked = value!;
                  });
                },
                title: const Text(
                  '👨‍💼 محمد إبراهيم (قسم المالية)',
                  textDirection: TextDirection.rtl,
                ),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAnnouncementSection(
      {required String title, required Widget child}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            const Divider(),
            child,
          ],
        ),
      ),
    );
  }
}
