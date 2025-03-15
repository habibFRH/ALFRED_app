import 'package:flutter/material.dart';

class TrainingSelectionPage extends StatefulWidget {
  const TrainingSelectionPage({super.key});

  @override
  _TrainingSelectionPageState createState() => _TrainingSelectionPageState();
}

class _TrainingSelectionPageState extends State<TrainingSelectionPage> {
  String? _selectedTraining; // Holds the selected training option

  final List<Map<String, dynamic>> _trainingOptions = [
    {"title": "التسويق", "icon": Icons.trending_up, "color": Colors.blue},
    {"title": "المعلوماتية", "icon": Icons.computer, "color": Colors.green},
    {
      "title": "المحاسبة القانونية",
      "icon": Icons.account_balance,
      "color": Colors.orange
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📚 التكوين الإلكتروني',
            textDirection: TextDirection.rtl),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Title: "اختر التدريب الذي تود القيام به"
            const Text(
              '📖 اختر التدريب الذي تود القيام به',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 20),

            // Selectable Training Cards
            Column(
              children: _trainingOptions.map((option) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTraining = option["title"];
                    });
                  },
                  child: Card(
                    color: _selectedTraining == option["title"]
                        ? option["color"].withOpacity(0.2)
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: _selectedTraining == option["title"]
                            ? option["color"]
                            : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(option["icon"], color: option["color"]),
                      title: Text(
                        option["title"],
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _selectedTraining == option["title"]
                              ? option["color"]
                              : Colors.black,
                        ),
                      ),
                      trailing: _selectedTraining == option["title"]
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Confirmation Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedTraining == null
                    ? null // Disable button if nothing is selected
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  '✅ تم اختيار $_selectedTraining بنجاح!')),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  '✅ تأكيد',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Info Text
            const Text(
              '📩 سيتواصل معك فريقنا في أقرب وقت من أجل التفاصيل',
              style: TextStyle(fontSize: 16, color: Colors.red),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 10),

            // Certification Info
            const Text(
              '🎓 ستحصل على شهادة في آخر التدريب',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }
}
